import xyz.dotdash.ceycord.api {
    Client
}
import xyz.dotdash.ceycord.api.entity {
    User
}
import ceylon.json {
    JsonObject
}

shared abstract class CeylonUser satisfies User {

    shared actual Client client;

    shared actual String id;
    shared actual String username;
    shared actual String discriminator;
    shared actual String? avatarId;
    shared actual String? avatarUrl;
    shared actual Boolean bot;
    shared actual Boolean mfaEnabled;

    shared new (Client client, JsonObject obj) {
        this.client = client;

        this.id = obj.getString("id");
        this.username = obj.getString("username");
        this.discriminator = obj.getString("discriminator");
        this.avatarId = obj.getStringOrNull("avatar");
        this.avatarUrl = if (exists avatarId) then "https://cdn.discordapp.com/avatars/``id``/``avatarId````afx(avatarId)``" else null;
        this.bot = obj.getBoolean("bot");
        this.mfaEnabled = obj.getBoolean("mfa_enabled");
    }

    equals(Object that) => if (is CeylonUser that) then this.id == that.id else false;

    hash => id.hash;

    string => "User(``id``)";
}

String afx(String avatarId) => avatarId.startsWith("a_") then ".gif" else ".png";