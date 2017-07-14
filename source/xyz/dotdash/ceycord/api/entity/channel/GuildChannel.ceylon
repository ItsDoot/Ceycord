import ceylon.promise {
    Promise
}

import xyz.dotdash.ceycord.api.entity {
    Guild,
    Webhook,
    GuildMember,
    User
}
import xyz.dotdash.ceycord.api.entity.message {
    GuildMessage
}

shared interface GuildChannel of GuildTextChannel | GuildVoiceChannel satisfies Channel {

    shared formal Guild guild;

    shared formal Integer position;

    //shared formal {PermissionOverwrite*} overwrites;
}

shared interface GuildTextChannel satisfies GuildChannel & TextChannel & Comparable<GuildTextChannel> {

    shared formal String topic;

    shared formal Boolean nsfw;

    shared formal Promise<{Webhook*}> webhooks;

    shared formal Promise<Nothing> deleteMessages({GuildMessage*} messages) ;

    shared formal Promise<Nothing> deleteMessagesWithIds({String*} ids) ;
}

shared interface GuildVoiceChannel satisfies GuildChannel & VoiceChannel & Comparable<GuildVoiceChannel> & Category<User|GuildMember> {
}