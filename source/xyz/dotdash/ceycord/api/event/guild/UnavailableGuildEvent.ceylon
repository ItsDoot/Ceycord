import xyz.dotdash.ceycord.api.entity {
    UnavailableGuild
}

"Signifies that a guild has become unavailable for whatever reason."
shared interface UnavailableGuildEvent satisfies GuildlikeEvent {

    shared formal actual UnavailableGuild guild;
}