import xyz.dotdash.ceycord.api.entity {
    Guild
}

shared interface GuildEvent satisfies GuildlikeEvent {

    shared formal actual Guild guild;
}