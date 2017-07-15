import xyz.dotdash.ceycord.api.entity.channel {
    GuildVoiceChannel
}
import xyz.dotdash.ceycord.api.entity {
    GuildLinked
}

shared interface GuildVoiceChannelManager satisfies GuildLinked & Manager<GuildVoiceChannelManager,GuildVoiceChannel> {

    shared formal variable String name;

    shared formal variable Integer userLimit;

    shared formal variable Integer bitrate;
}