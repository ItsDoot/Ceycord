import pw.dotdash.ceycord.api.entity.guild {
    Guild,
    GuildMember,
    Role
}
import pw.dotdash.ceycord.api.entity.user {
    User,
    VoiceState
}
import pw.dotdash.ceycord.api.entity.message {
    Message,
    Emoji
}
import ceylon.collection {
    MutableMap
}
import pw.dotdash.ceycord.api.entity.channel {
    GuildCategory,
    GuildTextChannel,
    GuildVoiceChannel
}
import pw.dotdash.ceycord.api.util {
    emptyMutableMap
}
shared class NoCacheService() satisfies CacheService {

    shared actual class Cache()
             extends super.Cache() {
        shared actual MutableMap<String,CacheService.GuildCache> guildMap => emptyMutableMap;

        shared actual MutableMap<String,Message> messageMap => nothing;

        shared actual MutableMap<String,User> userMap => nothing;

    }

    shared actual class GuildCache(Guild guild)
             extends super.GuildCache(guild) {

        shared actual MutableMap<String,GuildCategory> categoryMap => nothing;

        shared actual MutableMap<String,Emoji> emojiMap => nothing;

        shared actual MutableMap<String,GuildMember> memberMap => nothing;

        shared actual MutableMap<String,Role> roleMap => nothing;

        shared actual MutableMap<String,GuildTextChannel> textChannelMap => nothing;

        shared actual MutableMap<String,GuildVoiceChannel> voiceChannelMap => nothing;

        shared actual MutableMap<String,VoiceState> voiceStateMap => nothing;
    }
}