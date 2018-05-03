import ceylon.language.meta.declaration {
    Module
}
import ceylon.promise {
    Promise,
    Deferred
}

import pw.dotdash.ceycord.api {
    AccountType,
    Ceycord
}
import pw.dotdash.ceycord.api.entity.user {
    User,
    SelfUser
}
import pw.dotdash.ceycord.cache.service {
    MutableCacheService
}
import pw.dotdash.ceycord.impl.rest {
    Requester
}
import pw.dotdash.ceycord.api.entity.permission {
    Role
}
import pw.dotdash.ceycord.api.entity.guild {
    Guild
}
import pw.dotdash.ceycord.api.entity.channel {
    Category,
    GuildTextChannel,
    GuildVoiceChannel
}

shared class CeycordImpl(Module user, accountType, token) satisfies Ceycord {

    shared actual AccountType accountType;
    shared actual String token;
    shared Requester requester = Requester(user, accountType.prefix + token);

    shared actual MutableCacheService cache = services.cache(user);

    shared actual Promise<User> getUserById(String id) {
        value deferred = Deferred();
        return requester.getUserImpl(id);
    }

    shared actual Promise<Category> getCategoryById(String id) => nothing;

    shared actual Promise<Guild> getGuildById(String id) => nothing;

    shared actual Promise<GuildTextChannel> getGuildTextChannelById(String id) => nothing;

    shared actual Promise<GuildVoiceChannel> getGuildVoiceChannelById(String id) => nothing;

    shared actual Promise<Role> getRoleById(String id) => nothing;

    shared actual Integer ping => nothing;

    shared actual SelfUser selfUser => nothing;


    shared actual void disconnect() {
    }
}