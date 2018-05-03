import ceylon.time {
    Instant
}

import pw.dotdash.ceycord.api.entity {
    Unique
}
import pw.dotdash.ceycord.api.entity.channel {
    TextChannel
}
import pw.dotdash.ceycord.api.entity.user {
    User
}
import pw.dotdash.ceycord.api.entity.permission {
    Role
}

shared interface Message satisfies Unique {

    shared formal TextChannel channel;

    shared formal User author;

    shared formal String content;

    shared formal Instant timestamp;

    shared formal Instant? editTimestamp;

    shared formal Boolean tts;

    shared formal Boolean mentionsEveryone;

    shared formal User[] userMentions;

    shared formal Role[] roleMentions;

    shared formal TextChannel[] channelMentions;

    // TODO : attachments

    // TODO : embeds

    // TODO : reactions

    shared formal String? nonce;

    shared formal Boolean pinned;

    // TODO : webhook_id


}