import xyz.dotdash.ceycord.api.entity.channel {
    VoiceChannel
}

shared interface VoiceState satisfies ClientLinked {

    shared formal Boolean selfMuted;

    shared formal Boolean selfDeafened;

    shared formal VoiceChannel? channel;

    shared formal String sessionId;
}