import xyz.dotdash.ceycord.api.entity {
    Guildlike
}
import xyz.dotdash.ceycord.api.event {
    Event
}

shared interface GuildlikeEvent satisfies Event {

    shared formal Guildlike guild;
}