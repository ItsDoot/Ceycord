import ceylon.time.timezone {
    ZoneDateTime
}

import xyz.dotdash.ceycord.api.entity.channel {
    GuildChannel
}
import xyz.dotdash.ceycord.api.util {
    Permission,
    OnlineStatus
}

shared interface GuildMember satisfies ClientLinked & GuildLinked & Mentionable & PermissionHolder   {

    shared formal User user;

    shared formal String? nickname;

    shared default String effectiveName => nickname else user.name;

    shared formal {Role*} roles;

    shared formal Integer color;

    shared formal ZoneDateTime joinTimestamp;

    shared formal GuildVoiceState voiceState;

    shared formal Game? game;

    shared formal OnlineStatus? onlineStatus;

    shared formal {Permission*} channelPermissions(GuildChannel channel);

    shared formal Boolean owner;
}