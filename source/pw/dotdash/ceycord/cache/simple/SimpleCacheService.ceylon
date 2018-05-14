import ceylon.collection {
    MutableMap,
    HashMap
}

import pw.dotdash.ceycord.api.cache {
    CacheService
}
import pw.dotdash.ceycord.api.entity.guild {
    Role,
    GuildMember,
    Guild
}
import pw.dotdash.ceycord.api.entity.message {
    Message,
    Emoji
}
import pw.dotdash.ceycord.api.entity.user {
    User,
    VoiceState
}
import pw.dotdash.ceycord.api.entity.channel {
    GuildCategory,
    GuildTextChannel,
    GuildVoiceChannel
}

service (`interface CacheService`)
shared class SimpleCacheService() satisfies CacheService {

    shared actual class Cache()
            extends super.Cache() {

        shared actual MutableMap<String,CacheService.GuildCache> guildMap = HashMap<String,CacheService.GuildCache>();

        shared actual MutableMap<String,Message> messageMap = HashMap<String,Message>();

        shared actual MutableMap<String,User> userMap = HashMap<String,User>();
    }

    shared actual class GuildCache(Guild guild)
            extends super.GuildCache(guild) {

        shared actual MutableMap<String,GuildCategory> categoryMap = HashMap<String,GuildCategory>();

        shared actual MutableMap<String,Emoji> emojiMap = HashMap<String,Emoji>();

        shared actual MutableMap<String,GuildMember> memberMap = HashMap<String,GuildMember>();

        shared actual MutableMap<String,Role> roleMap = HashMap<String,Role>();

        shared actual MutableMap<String,GuildTextChannel> textChannelMap = HashMap<String,GuildTextChannel>();

        shared actual MutableMap<String,GuildVoiceChannel> voiceChannelMap = HashMap<String,GuildVoiceChannel>();

        shared actual MutableMap<String,VoiceState> voiceStateMap = HashMap<String,VoiceState>();

    }
}