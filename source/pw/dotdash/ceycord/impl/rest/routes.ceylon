import pw.dotdash.ceycord.api.http {
    get,
    put,
    patch,
    delete,
    post
}

shared object routes {

    shared object users {

        shared Route<[String]> getUser = Route(get, (String userId) => "/users/``userId``");

        shared Route<[String]> getProfile = Route(get, (String userId) => "/users/``userId``/profile");

        shared object self {

            shared Route<[]> getSelf = Route(get, () => "/users/@me");

            shared Route<[]> modifySelf = Route(patch, () => "/users/@me");

            shared Route<[]> getGuilds = Route(get, () => "/users/@me/guilds");

            shared Route<[String]> leaveGuild = Route(delete, (String guildId) => "/users/@me/guilds/``guildId``");

            shared Route<[]> getDirectChannels = Route(get, () => "/users/@me/channels");

            shared Route<[]> createDirectChannel = Route(post, () => "/users/@me/channels");

            shared Route<[String]> getNote = Route(get, (String userId) => "/users/@me/notes/``userId``");

            shared Route<[String]> setNote = Route(put, (String userId) => "/users/@me/notes/``userId``");
        }
    }
}