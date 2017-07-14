import ceylon.json {
    JsonObject
}

import xyz.dotdash.ceycord.api {
    Client
}
import xyz.dotdash.ceycord.api.entity {
    GuildMember,
    Guild,
    User
}

shared abstract class CeylonGuildMember satisfies GuildMember {

    shared actual Client client;
    shared actual Guild guild;
    shared actual User user;
    shared actual String? nickname;

    shared new (Guild guild, JsonObject obj) {
        this.client = guild.client;
        this.guild = guild;
        this.user = nothing;
        this.nickname = obj.getStringOrNull("nick");
    }
}