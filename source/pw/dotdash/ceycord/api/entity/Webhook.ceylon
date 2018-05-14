import pw.dotdash.ceycord.api.entity.channel {
    TextChannel
}
import pw.dotdash.ceycord.api.entity.guild {
    Guild,
    GuildMember
}
import pw.dotdash.ceycord.api.entity.user {
    User
}

shared interface Webhook satisfies Unique {

    shared formal Guild? guild;

    shared formal TextChannel channel;

    shared formal User? user;

    shared formal GuildMember? member;

    shared formal String? name;

    shared formal String? avatar;

    shared formal String token;
}