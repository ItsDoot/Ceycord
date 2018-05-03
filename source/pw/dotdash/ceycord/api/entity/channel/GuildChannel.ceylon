import pw.dotdash.ceycord.api.entity.guild {
    Guild
}

shared interface GuildChannel {

    shared formal Guild guild;

    shared formal Category? category;

    shared formal String name;

    shared formal Boolean nsfw;

    shared formal Integer position;
}