import pw.dotdash.ceycord.api.entity.channel {
    VoiceChannel
}

shared interface VoiceState {

    shared formal VoiceChannel? channel;

    shared formal User user;

    shared formal String session;

    shared formal Boolean deafened;

    shared formal Boolean muted;

    shared formal Boolean selfDeafened;

    shared formal Boolean selfMuted;

    shared formal Boolean suppressed;
}