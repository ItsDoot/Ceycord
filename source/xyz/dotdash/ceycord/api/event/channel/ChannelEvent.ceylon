import xyz.dotdash.ceycord.api.entity.channel {
    Channel
}

shared interface ChannelEvent<ChannelType> given ChannelType satisfies Channel {

    shared formal ChannelType channel;
}