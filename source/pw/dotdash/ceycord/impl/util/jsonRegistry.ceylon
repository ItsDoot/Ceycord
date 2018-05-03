import ceylon.collection {
    HashMap
}
import ceylon.json {
    JsonObject
}
import ceylon.language.meta {
    typeLiteral
}
import ceylon.language.meta.model {
    Type
}

import pw.dotdash.ceycord.impl.entity {
    UserImpl
}

shared object jsonRegistry {

    value serializers = HashMap<Type<Anything>,JsonObject(Nothing)>();
    value deserializers = HashMap<Type<Anything>,Anything(JsonObject)>();

    shared void register<Entity>(
            JsonObject serialize(Entity entity),
            Entity deserialize(JsonObject json)) {
        serializers.put(`Entity`, serialize);
        deserializers.put(`Entity`, deserialize);
    }

    shared JsonObject serialize<Entity>(Entity entity) {
        "Could not find a serializer that supports ``typeLiteral<Entity>()``"
        assert (is JsonObject(Entity) serializer = serializers.get(`Entity`));
        return serializer(entity);
    }

    shared Entity deserialize<Entity>(JsonObject json) {
        "Could not find a deserializer that supports ``typeLiteral<Entity>()``"
        assert (is Entity(JsonObject) deserializer = deserializers.get(`Entity`));
        return deserializer(json);
    }

    shared void registerStandard() {
        register<UserImpl>((entity) => JsonObject {
            "id"->entity.id,
            "username"->entity.name,
            "discriminator"->entity.discriminator,
            "avatar"->entity.avatar,
            "bot"->entity.bot,
            "mfa_enabled"->entity.mfaEnabled
        }, (json) => UserImpl {
            id = json.getString("id");
            name = json.getString("username");
            discriminator = json.getString("discriminator");
            avatar = json.getStringOrNull("avatar");
            bot = json.defines("bot") then json.getBoolean("bot") else false;
            mfaEnabled = json.defines("mfa_enabled") then json.getBoolean("mfa_enabled") else false;
        });
    }
}