import ceylon.json {
    JsonObject
}

import pw.dotdash.ceycord.impl.util {
    jsonRegistry
}

shared interface Jsonable<Entity> of Entity
        given Entity satisfies Object {

    suppressWarnings ("unknownWarning")
    shared static Entity parse(JsonObject json) => jsonRegistry.deserialize<Entity>(json);

    shared JsonObject json => jsonRegistry.serialize<Entity>(this of Entity);
}