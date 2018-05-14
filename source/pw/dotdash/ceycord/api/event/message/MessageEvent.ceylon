import pw.dotdash.ceycord.api.event {
    Event
}
import pw.dotdash.ceycord.api.entity.message {
    Message
}

shared interface MessageEvent satisfies Event {

    shared formal Message message;
}