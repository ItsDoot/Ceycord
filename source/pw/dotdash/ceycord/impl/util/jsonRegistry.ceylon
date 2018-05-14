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

import pw.dotdash.ceycord.api {
    Ceycord
}
import pw.dotdash.ceycord.impl.entity {
    UserImpl,
    RoleImpl
}

shared object jsonRegistry {

    value serializers = HashMap<Type<Anything>,JsonObject(Nothing)>();
    value deserializers = HashMap<Type<Anything>,Anything(ParsingContext, JsonObject)>();

    shared void register<Entity>(
            JsonObject serialize(Entity entity),
            Entity deserialize(ParsingContext ctx, JsonObject json)) {
        serializers.put(`Entity`, serialize);
        deserializers.put(`Entity`, deserialize);
    }

    shared JsonObject serialize<Entity>(Entity entity) {
        "Could not find a serializer that supports ``typeLiteral<Entity>()``"
        assert (is JsonObject(Entity) serializer = serializers.get(`Entity`));
        return serializer(entity);
    }

    shared Entity deserialize<Entity>(Ceycord ceycord, JsonObject json) {
        "Could not find a deserializer that supports ``typeLiteral<Entity>()``"
        assert (is Entity(Ceycord, JsonObject) deserializer = deserializers.get(`Entity`));
        return deserializer(ceycord, json);
    }

    shared void registerStandard() {
        register(UserImpl.json, UserImpl.fromJson);
        register(RoleImpl.json, RoleImpl.fromJson);
    }
}