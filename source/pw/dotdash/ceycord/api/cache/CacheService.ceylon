import ceylon.collection {
    MutableMap
}

import pw.dotdash.ceycord.api.entity.channel {
    GuildCategory,
    GuildVoiceChannel,
    GuildTextChannel
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

shared interface CacheService {

    shared formal class Cache() {

        shared formal MutableMap<String,GuildCache> guildMap;

        shared formal MutableMap<String,Message> messageMap;

        shared formal MutableMap<String,User> userMap;

        shared default Map<String,GuildCategory> categoryMap => map(guildMap.flatMap((key->item) => item.categoryMap));

        shared default Map<String,Emoji> emojiMap => map(guildMap.flatMap((key->item) => item.emojiMap));

        shared default Map<String,GuildMember> memberMap => map(guildMap.flatMap((key->item) => item.memberMap));

        shared default Map<String,Role> roleMap => map(guildMap.flatMap((key->item) => item.roleMap));

        shared default Map<String,GuildTextChannel> textChannelMap => map(guildMap.flatMap((key->item) => item.textChannelMap));

        shared default Map<String,GuildVoiceChannel> voiceChannelMap => map(guildMap.flatMap((key->item) => item.voiceChannelMap));

        shared default Map<String,VoiceState> voiceStateMap => map(guildMap.flatMap((key->item) => item.voiceStateMap));
    }

    shared formal class GuildCache(guild) {

        shared Guild guild;

        shared formal MutableMap<String,GuildCategory> categoryMap;

        shared formal MutableMap<String,Emoji> emojiMap;

        shared formal MutableMap<String,GuildMember> memberMap;

        shared formal MutableMap<String,Role> roleMap;

        shared formal MutableMap<String,GuildTextChannel> textChannelMap;

        shared formal MutableMap<String,GuildVoiceChannel> voiceChannelMap;

        shared formal MutableMap<String,VoiceState> voiceStateMap;
    }
}