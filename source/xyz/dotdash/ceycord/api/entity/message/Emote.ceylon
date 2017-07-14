import xyz.dotdash.ceycord.api.entity {
    Distinct,
    GuildLinked,
    Role,
    ClientLinked
}
import ceylon.promise {
    Promise
}

shared interface Emote satisfies Distinct & GuildLinked & ClientLinked {

    shared formal {Role*} roles;

    shared formal String name;

    shared formal Boolean managed;

    shared formal Promise<Nothing> delete() ;

    shared formal String imageUrl;
}