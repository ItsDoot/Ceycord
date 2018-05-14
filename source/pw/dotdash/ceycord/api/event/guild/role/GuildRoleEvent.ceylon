import pw.dotdash.ceycord.api.entity.guild {
    Role
}
import pw.dotdash.ceycord.api.event.guild {
    GuildEvent
}

shared interface GuildRoleEvent satisfies GuildEvent {

    shared formal Role role;
}