import pw.dotdash.ceycord.api.entity.message {
    Message
}

shared interface BulkDeleteMessageEvent satisfies MessageEvent {

    shared formal {Message+} messages;

    shared actual Message message => messages.first;
}