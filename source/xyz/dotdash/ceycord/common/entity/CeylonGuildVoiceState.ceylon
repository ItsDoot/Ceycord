import xyz.dotdash.ceycord.api.entity {
    GuildVoiceState,
    Guild,
    GuildMember
}

shared abstract class CeylonGuildVoiceState satisfies GuildVoiceState {

    shared actual Guild guild;
    shared actual GuildMember member;

    shared new (Guild guild, GuildMember member) {
        this.guild = guild;
        this.member = member;
    }


}