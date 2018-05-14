import pw.dotdash.ceycord.api.entity.user {
    User
}

shared interface GuildMember {

    shared formal User user;

    shared formal String? nick;

    shared default String name => nick else user.name;

    shared formal Role[] roles;

    shared formal Boolean deafened;

    shared formal Boolean muted;
}