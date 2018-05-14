import ceylon.time {
    Instant
}

import pw.dotdash.ceycord.api.entity {
    Unique
}
import pw.dotdash.ceycord.api.entity.user {
    User
}

shared interface Integration satisfies Unique {

    shared static interface Account {

        shared formal String id;

        shared formal String name;
    }

    shared formal String name;

    shared formal String type;

    shared formal Boolean enabled;

    shared formal Boolean syncing;

    shared formal Role role;

    shared formal Integer expireBehavior;

    shared formal Integer expireGracePeriod;

    shared formal User user;

    shared formal Account account;

    shared formal Instant lastSync;
}