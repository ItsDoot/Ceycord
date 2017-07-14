shared interface GuildVoiceState satisfies VoiceState {

    shared formal Boolean muted;

    shared formal Boolean deafened;

    shared formal Boolean guildMuted;

    shared formal Boolean guildDeafened;

    shared formal Boolean suppressed;

    shared formal Guild guild;

    shared formal GuildMember member;
}