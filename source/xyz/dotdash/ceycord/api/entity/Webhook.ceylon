import ceylon.promise {
    Promise
}

import xyz.dotdash.ceycord.api.entity.channel {
    GuildTextChannel
}

shared interface Webhook satisfies Distinct & ClientLinked {

    shared formal Guild guild;

    shared formal GuildTextChannel textChannel;

    shared formal GuildMember owner;

    shared formal User defaultUser;

    shared formal String name;

    shared formal String token;

    shared formal String url;

    shared formal Promise<Nothing> delete() ;

}