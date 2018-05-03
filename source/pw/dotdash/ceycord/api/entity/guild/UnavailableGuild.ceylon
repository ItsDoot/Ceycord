shared interface UnavailableGuild satisfies Guildlike {

    shared actual Boolean available => false;
}