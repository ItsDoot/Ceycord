import ceylon.language.meta.declaration {
    Module
}
import ceylon.promise {
    Promise,
    Deferred
}

import pw.dotdash.ceycord.api {
    Ceycord
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
import pw.dotdash.ceycord.impl.rest {
    Requester
}

shared class CeycordImpl(Module user, token) satisfies Ceycord {

    shared actual String token;
    shared late Requester requester;

    shared actual CacheService.Cache cache = services.cache(user).Cache();

    shared void initialize() {
        requester = Requester(user, this, "Bot " + token);
    }

    shared actual Promise<User> getUser(String id) {
        value deferred = Deferred<User>();

        if (exists user = cache.userMap[id]) {
            deferred.fulfill(user);
        } else {
            deferred.fulfill(requester.getUserImpl(id));
        }

        return deferred.promise;
    }

    shared actual Promise<Guild> getGuild(String id) {
        value deferred = Deferred<Guild>();

        if (exists guild = cache.guildMap[id]?.guild) {
            deferred.fulfill(guild);
        }

        return deferred.promise;
    }

    shared actual Promise<GuildCategory> getCategory(String id) {
        value deferred = Deferred<GuildCategory>();

        if (exists category = cache.categoryMap[id]) {
            deferred.fulfill(category);
        }

        return deferred.promise;
    }

    shared actual Promise<GuildTextChannel> getGuildTextChannel(String id) {
        value deferred = Deferred<GuildTextChannel>();

        if (exists guildTextChannel = cache.textChannelMap[id]) {
            deferred.fulfill(guildTextChannel);
        }

        return deferred.promise;
    }

    shared actual Promise<GuildVoiceChannel> getGuildVoiceChannel(String id) {
        value deferred = Deferred<GuildVoiceChannel>();

        if (exists guildVoiceChannel = cache.voiceChannelMap[id]) {
            deferred.fulfill(guildVoiceChannel);
        }

        return deferred.promise;
    }

    shared actual Promise<Role> getRole(String id) {
        value deferred = Deferred<Role>();

        if (exists role = cache.roleMap[id]) {
            deferred.fulfill(role);
        }

        return deferred.promise;
    }

    shared actual Integer ping => nothing;

    shared actual SelfUser selfUser => nothing;

    shared actual void disconnect() {
    }
}