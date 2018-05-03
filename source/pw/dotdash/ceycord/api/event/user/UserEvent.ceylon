import pw.dotdash.ceycord.api.entity.user {
    User
}
import pw.dotdash.ceycord.api.event {
    Event
}

shared interface UserEvent satisfies Event {

    shared formal User user;
}