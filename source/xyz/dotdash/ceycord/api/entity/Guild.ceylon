import ceylon.time {
    Period
}

import xyz.dotdash.ceycord.api.entity.channel {
    GuildVoiceChannel,
    GuildTextChannel
}
import ceylon.promise {
    Promise
}
import xyz.dotdash.ceycord.api {
    Region
}

shared interface Guildlike of Guild | UnavailableGuild satisfies Distinct {

    shared formal Boolean available;
}

shared interface Guild satisfies Guildlike & ClientLinked & Category<User> {

    shared formal String name;

    shared formal String? icon;

    shared formal String? splash;

    shared formal GuildMember owner;

    shared formal GuildVoiceChannel afkChannel;

    shared formal Timeout afkTimeout;

    shared formal Region region;

    shared formal actual Boolean contains(User user) ;

    shared formal GuildMember getMember(User|String user) ;

    shared formal {GuildMember+} members;

    shared formal GuildTextChannel getTextChannel(String id) ;

    shared formal {GuildTextChannel+} textChannels;

    shared formal GuildTextChannel publicChannel;

    shared formal GuildVoiceChannel getVoiceChannel(String id) ;

    shared formal {GuildVoiceChannel*} voiceChannels;

    shared formal Role getRole(String id) ;

    shared formal {Role*} roles;

    shared formal Role publicRole;

    shared formal Promise<Nothing> leave() ;

    shared formal Promise<Nothing> delete(String? mfaCode = null) ;

    shared actual Boolean available => true;
}

shared interface UnavailableGuild satisfies Guildlike {

    shared actual Boolean available => false;
}

shared class Timeout {

    shared Period period;

    abstract new seconds(Integer seconds) {
        this.period = Period { seconds = seconds; };
    }

    shared new seconds60 extends seconds(60) {}

    shared new seconds300 extends seconds(300) {}

    shared new seconds900 extends seconds(900) {}

    shared new seconds1800 extends seconds(1800) {}

    shared new seconds3600 extends seconds(3600) {}
}