import ceylon.promise {
    Promise
}

import xyz.dotdash.ceycord.api.entity {
    Distinct,
    GuildLinked,
    Role,
    ClientLinked,
    Nameable
}

shared interface Emote satisfies Distinct & GuildLinked & ClientLinked & Nameable {

    shared formal {Role*} roles;

    shared formal Boolean managed;

    shared formal Promise<Nothing> delete() ;

    shared formal String imageUrl;
}