import ceylon.collection {
    ArrayList
}
import ceylon.json {
    JsonObject
}

shared object jsonFormat {

    value deserializers = ArrayList<JsonObject(Nothing)>();
    value serializers = ArrayList<Anything(JsonObject)>();

    shared JsonObject deserialize<Type>(Type instance) given Type satisfies Object {
        "No deserializer exists for that type."
        assert (exists deserializer = deserializers.narrow<JsonObject(Type)>().first);

        return deserializer(instance);
    }

    shared Type serialize<Type>(JsonObject json) given Type satisfies Object {
        "No serializer exists for that type."
        assert (exists serializer = serializers.narrow<Type(JsonObject)>().first);

        return serializer(json);
    }

    shared void add<Type>(deserialize, serialize) given Type satisfies Object {
        JsonObject deserialize(Type instance);
        Type serialize(JsonObject json);

        deserializers.add(deserialize);
        serializers.add(serialize);
    }
}

