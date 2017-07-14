import xyz.dotdash.ceycord.api.entity {
    User,
    Guild,
    Role
}
import xyz.dotdash.ceycord.api.entity.channel {
    VoiceChannel,
    TextChannel
}

shared interface Client {

    shared formal Integer ping;

    shared formal {User*} users;

    shared formal User? getUser(String id) ;

    shared formal {Guild*} guilds;

    shared formal Guild? getGuild(String id) ;

    shared formal {Role*} roles;

    shared formal Role? getRole(String id) ;

    shared formal {TextChannel*} textChannels;

    shared formal TextChannel? getTextChannel(String id) ;

    shared formal {VoiceChannel*} voiceChannels;

    shared formal VoiceChannel? getVoiceChannel(String id) ;

    shared formal User selfUser;

    shared formal String token;

    shared formal void shutdown() ;
}

shared native Client client(String token) ;

shared native ("jvm") Client client(String token) {
    return nothing;
    //return JavaClient(token);
}