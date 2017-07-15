import ceylon.promise {
    Promise
}

import xyz.dotdash.ceycord.api.entity.channel {
    DirectTextChannel
}

shared interface User satisfies Distinct & ClientLinked & Mentionable {

    shared formal String name;

    shared formal String discriminator;

    shared formal String? avatarId;

    shared formal String? avatarUrl;

    shared formal Boolean bot;

    shared formal Boolean mfaEnabled;

    shared formal Promise<DirectTextChannel> channel;

    shared formal {Guild*} mutualGuilds;
}