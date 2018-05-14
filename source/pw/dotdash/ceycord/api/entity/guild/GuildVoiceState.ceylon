import pw.dotdash.ceycord.api.entity.user {
    VoiceState
}

shared interface GuildVoiceState satisfies VoiceState {

    shared formal Guild guild;

    shared formal GuildMember member;
}