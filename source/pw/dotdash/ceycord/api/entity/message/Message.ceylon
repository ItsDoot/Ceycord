import ceylon.time {
    Instant
}

import pw.dotdash.ceycord.api.entity {
    Unique
}
import pw.dotdash.ceycord.api.entity.channel {
    TextChannel
}
import pw.dotdash.ceycord.api.entity.guild {
    Role
}
import pw.dotdash.ceycord.api.entity.user {
    User
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

    shared formal Attachment[] attachments;

    shared formal Embed[] embeds;

    shared formal Reaction[] reactions;

    shared formal String? nonce;

    shared formal Boolean pinned;

    // TODO : webhook_id


}