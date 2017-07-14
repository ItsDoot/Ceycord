import xyz.dotdash.ceycord.api.entity {
    ClientLinked,
    Guild,
    User,
    Distinct
}
import xyz.dotdash.ceycord.api.entity.channel {
    TextChannel
}
import ceylon.promise {
    Promise
}

shared interface Reaction satisfies ClientLinked {

    shared formal Boolean self;

    shared formal Integer count;

    shared formal Guild guild;

    shared formal TextChannel channel;

    shared formal String messageId;

    shared formal Promise<Nothing> remove(User user = client.selfUser);

    shared interface Emote satisfies Distinct {

        shared formal String name;


    }
}