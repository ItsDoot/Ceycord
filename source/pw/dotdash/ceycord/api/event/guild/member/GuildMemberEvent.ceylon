import pw.dotdash.ceycord.api.entity.guild {
    GuildMember
}
import pw.dotdash.ceycord.api.event.guild {
    GuildEvent
}

shared interface GuildMemberEvent satisfies GuildEvent {

    shared formal GuildMember member;
}