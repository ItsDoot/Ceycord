import xyz.dotdash.ceycord.api.entity {
    Webhook,
    GuildLinked
}
import xyz.dotdash.ceycord.api.entity.channel {
    GuildTextChannel
}

shared interface WebhookManager satisfies GuildLinked & Manager<WebhookManager,Webhook> {

    shared formal variable String name;

    shared formal variable GuildTextChannel channel;
}