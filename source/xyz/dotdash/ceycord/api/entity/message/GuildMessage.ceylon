import xyz.dotdash.ceycord.api.entity {
    Role,
    GuildLinked
}
import xyz.dotdash.ceycord.api.entity.channel {
    GuildTextChannel
}

shared interface GuildMessage satisfies GuildLinked & Message & Category<GuildTextChannel|Role> {

    shared formal actual GuildTextChannel channel;
}