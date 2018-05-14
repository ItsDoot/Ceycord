import pw.dotdash.ceycord.api.entity.channel {
    Channel
}
import pw.dotdash.ceycord.api.event {
    Event
}

shared interface ChannelEvent<ChannelType>
        satisfies Event
        given ChannelType satisfies Channel {

    shared formal ChannelType channel;
}