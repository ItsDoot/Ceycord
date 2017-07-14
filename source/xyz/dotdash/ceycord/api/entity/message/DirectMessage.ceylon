import xyz.dotdash.ceycord.api.entity {
    User
}
import xyz.dotdash.ceycord.api.entity.channel {
    DirectTextChannel
}

shared interface DirectMessage satisfies Message {

    shared formal actual DirectTextChannel channel;

    shared formal User recipient;
}