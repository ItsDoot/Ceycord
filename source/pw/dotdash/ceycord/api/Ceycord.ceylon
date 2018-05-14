import ceylon.promise {
    Promise
}

import pw.dotdash.ceycord.api.cache {
    CacheService
}
import pw.dotdash.ceycord.api.entity.channel {
    GuildCategory,
    GuildTextChannel,
    GuildVoiceChannel
}
import pw.dotdash.ceycord.api.entity.guild {
    Guild,
    Role
}
import pw.dotdash.ceycord.api.entity.user {
    User,
    SelfUser
}

shared interface Ceycord {

    shared formal String token;

    shared formal Integer ping;

    shared formal SelfUser selfUser;

    shared formal CacheService.Cache cache;

    shared formal void disconnect() ;

    shared formal Promise<User> getUser(String id) ;

    shared formal Promise<Guild> getGuild(String id) ;

    shared formal Promise<Role> getRole(String id) ;

    shared formal Promise<GuildCategory> getCategory(String id) ;

    shared formal Promise<GuildTextChannel> getGuildTextChannel(String id) ;

    shared formal Promise<GuildVoiceChannel> getGuildVoiceChannel(String id) ;

    // TODO : newGuild
}