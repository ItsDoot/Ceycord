import pw.dotdash.ceycord.api.entity.user {
    User
}

shared interface Ban {

    shared formal String? reason;

    shared formal User user;
}