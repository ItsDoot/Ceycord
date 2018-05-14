import ceylon.json {
    JsonObject
}

import pw.dotdash.ceycord.api {
    Ceycord
}
import pw.dotdash.ceycord.api.entity.user {
    User,
    UserStatus
}
import pw.dotdash.ceycord.impl.util {
    ParsingContext
}

shared class UserImpl satisfies User & Jsonable {

    shared actual Ceycord ceycord;
    shared actual String id;
    shared actual variable String name;
    shared actual variable String discriminator;
    shared actual variable String? avatar;
    shared actual Boolean bot;
    shared actual variable Boolean mfaEnabled;

    shared new (Ceycord ceycord, String id, String name, String discriminator, String? avatar, Boolean bot, Boolean mfaEnabled) {
        this.ceycord = ceycord;
        this.id = id;
        this.name = name;
        this.discriminator = discriminator;
        this.avatar = avatar;
        this.bot = bot;
        this.mfaEnabled = mfaEnabled;
    }

    shared new fromJson(ParsingContext ctx, JsonObject json) {
        this.ceycord = ctx.ceycord;
        this.id = json.getString("id");
        this.name = json.getString("username");
        this.discriminator = json.getString("discriminator");
        this.avatar = json.getStringOrNull("avatar");
        this.bot = json.defines("bot") then json.getBoolean("bot") else false;
        this.mfaEnabled = json.defines("mfa_enabled") then json.getBoolean("mfa_enabled") else false;
    }

    avatarUrl = if (exists a = avatar) then "https://cdn.discordapp.com/avatars/``id``/``a + (a.startsWith("a_") then ".gif" else ".png")``" else null;

    equals(Object that) => if (is UserImpl that) then id == that.id else false;

    hash = id.hash;

    string = "U(``id``|``name``)";

    shared actual UserStatus status => UserStatus.online;

    shared actual JsonObject json => JsonObject {
        "id"->this.id,
        "username"->this.name,
        "discriminator"->this.discriminator,
        "avatar"->this.avatar,
        "bot"->this.bot,
        "mfa_enabled"->this.mfaEnabled
    };
}