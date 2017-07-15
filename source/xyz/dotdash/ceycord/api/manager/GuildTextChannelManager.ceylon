import xyz.dotdash.ceycord.api.entity.channel {
    GuildTextChannel
}
import xyz.dotdash.ceycord.api.entity {
    GuildLinked
}

shared interface GuildTextChannelManager satisfies GuildLinked & Manager<GuildTextChannelManager,GuildTextChannel> {

    shared formal variable String name;

    shared formal variable String topic;
}