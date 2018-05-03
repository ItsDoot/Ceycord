import pw.dotdash.ceycord.api.entity {
    Unique,
    Mentionable
}

shared interface User satisfies Unique & Mentionable {

    shared formal String name;

    shared formal String discriminator;

    shared formal String? avatar;

    shared formal String? avatarUrl;

    shared formal Boolean bot;

    shared formal Boolean mfaEnabled;

    shared formal UserStatus status;

    shared actual String mention => "<@``id``>";

    shared actual String mentionNickname => "<@!``id``>";
}