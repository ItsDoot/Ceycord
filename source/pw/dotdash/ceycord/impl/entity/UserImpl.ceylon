import pw.dotdash.ceycord.api.entity.user {
    User,
    UserStatus
}

shared class UserImpl satisfies User {

    shared actual String id;
    shared actual String name;
    shared actual String discriminator;
    shared actual String? avatar;
    shared actual Boolean bot;
    shared actual Boolean mfaEnabled;

    shared new (String id, String name, String discriminator, String? avatar, Boolean bot, Boolean mfaEnabled) {
        this.id = id;
        this.name = name;
        this.discriminator = discriminator;
        this.avatar = avatar;
        this.bot = bot;
        this.mfaEnabled = mfaEnabled;
    }

    avatarUrl = if (exists avatar) then "https://cdn.discordapp.com/avatars/``id``/``avatar``" + (avatar.startsWith("a_") then ".gif" else ".png") else null;

    equals(Object that) => if (is UserImpl that) then id == that.id else false;

    hash = id.hash;

    string = "U(``id``|``name``)";

    shared actual UserStatus status => UserStatus.online;
}