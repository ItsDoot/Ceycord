import ceylon.language.meta.declaration {
    Module
}
import ceylon.promise {
    Promise
}

import pw.dotdash.ceycord.api.entity.channel {
    Category,
    GuildTextChannel,
    GuildVoiceChannel
}
import pw.dotdash.ceycord.api.entity.guild {
    Guild
}
import pw.dotdash.ceycord.api.entity.permission {
    Role
}
import pw.dotdash.ceycord.api.entity.user {
    User,
    UserStatus,
    SelfUser
}
import pw.dotdash.ceycord.cache.service {
    CacheService
}

shared interface Ceycord {

    shared formal AccountType accountType;

    shared formal String token;

    shared formal Integer ping;

    shared formal SelfUser selfUser;

    shared formal CacheService cache;

    shared formal void disconnect() ;

    shared formal Promise<User> getUserById(String id) ;

    shared formal Promise<Guild> getGuildById(String id) ;

    shared formal Promise<Role> getRoleById(String id) ;

    shared formal Promise<Category> getCategoryById(String id) ;

    shared formal Promise<GuildTextChannel> getGuildTextChannelById(String id) ;

    shared formal Promise<GuildVoiceChannel> getGuildVoiceChannelById(String id) ;
}