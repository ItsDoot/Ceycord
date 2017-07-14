import ceylon.promise {
    Promise
}
import ceylon.time.timezone {
    ZoneDateTime
}

import xyz.dotdash.ceycord.api.entity {
    User,
    ClientLinked
}
import xyz.dotdash.ceycord.api.entity.channel {
    TextChannel
}

shared interface Message satisfies ClientLinked & Category<User> {

    shared formal {User*} mentionedUsers;

    shared formal Boolean everyone;

    shared formal ZoneDateTime? editedTime;

    shared formal User author;

    shared formal Text content;

    shared formal Boolean webhook;

    shared formal TextChannel channel;

    shared formal {Attachment*} attachments;

    shared formal {Embed*} embeds;

    shared formal {Emote*} emotes;

    shared formal {Reaction*} reactions;

    shared formal Boolean tts;

    shared formal Promise<Message> edit(Text newContent) ;

    shared formal Promise<Nothing> delete() ;

    shared formal Boolean pinned;

    shared formal Promise<Nothing> pin() ;

    shared formal Promise<Nothing> unpin() ;

    shared formal Promise<Nothing> react(Emote|String emote) ;

    shared formal Promise<Nothing> clearReactions() ;
}