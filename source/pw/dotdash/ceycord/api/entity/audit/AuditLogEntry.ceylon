import pw.dotdash.ceycord.api.entity {
    Unique
}
import pw.dotdash.ceycord.api.entity.user {
    User
}

shared interface AuditLogEntry satisfies Unique {

    shared formal User user;

    shared formal String? target;

    shared formal String? reason;
}