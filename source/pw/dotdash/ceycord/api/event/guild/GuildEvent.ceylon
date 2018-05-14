import pw.dotdash.ceycord.api.event {
    Event
}
import pw.dotdash.ceycord.api.entity.guild {
    Guild
}

shared interface GuildEvent satisfies Event {

    shared formal Guild guild;
}