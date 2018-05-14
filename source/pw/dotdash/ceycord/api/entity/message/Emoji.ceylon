import pw.dotdash.ceycord.api.entity.guild {
    Role
}
import pw.dotdash.ceycord.api.entity.user {
    User
}

shared interface Emoji {

    "The unique ID of the emoji. [[null]] if the emoji is part of the standard set."
    shared formal String? id;

    "The name of the emoji."
    shared formal String name;

    "The roles the emoji is whitelisted to."
    shared formal Role[] roles;

    "The user that created the emoji (if available)."
    shared formal User? user;

    "Whether the emoji must be wrapped in colons."
    shared formal Boolean colons;

    "Whether the emoji is managed."
    shared formal Boolean managed;

    "Whether the emoji is animated."
    shared formal Boolean animated;
}