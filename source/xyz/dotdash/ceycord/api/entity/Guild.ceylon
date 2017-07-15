import ceylon.promise {
    Promise
}
import ceylon.time {
    Period
}

import xyz.dotdash.ceycord.api.entity.channel {
    GuildVoiceChannel,
    GuildTextChannel
}
import xyz.dotdash.ceycord.api.entity.message {
    Emote
}
import xyz.dotdash.ceycord.api.manager {
    GuildManager,
    Manageable
}
import xyz.dotdash.ceycord.api.util {
    Region,
    VerificationLevel,
    NotificationLevel,
    ExplicitContentLevel,
    MFALevel,
    filters
}

shared interface Guildlike of Guild | UnavailableGuild satisfies Distinct {

    shared formal Boolean available;
}

shared interface Guild satisfies Guildlike & ClientLinked & Nameable & Category<User> & Manageable<Guild,GuildManager> {


    shared formal String? iconId;

    shared formal String? iconUrl;

    shared formal String? splashId;

    shared formal String? splashUrl;

    shared formal GuildMember owner;

    shared formal GuildVoiceChannel afkChannel;

    shared formal AfkTimeout afkTimeout;

    shared formal Region region;

    shared formal actual Boolean contains(User user) ;

    shared formal GuildMember selfMember;

    shared formal GuildMember getMember(User|String user) ;

    shared formal {GuildMember+} members;

    shared default {GuildMember*} membersWithName(String name, Boolean ignoreCase = false)
            => members.filter(filters.member.byName(name, ignoreCase));

    shared default {GuildMember*} membersWithNickname(String nickname, Boolean ignoreCase = false)
            => members.filter(filters.member.byNickname(nickname, ignoreCase));

    shared default {GuildMember*} membersWithEffectiveName(String effectiveName, Boolean ignoreCase = false)
            => members.filter(filters.member.byEffectiveName(effectiveName, ignoreCase));

    shared default {GuildMember*} membersWithRoles({Role*} roles)
            => members.filter(filters.member.byRoles(roles));

    shared formal GuildTextChannel getTextChannel(String id) ;

    shared formal {GuildTextChannel+} textChannels;

    shared default {GuildTextChannel*} textChannelsWithName(String name, Boolean ignoreCase = false)
            => textChannels.filter(filters.byName(name, ignoreCase));

    shared formal GuildTextChannel publicChannel;

    shared formal GuildVoiceChannel getVoiceChannel(String id) ;

    shared formal {GuildVoiceChannel*} voiceChannels;

    shared default {GuildVoiceChannel*} voiceChannelsWithName(String name, Boolean ignoreCase = false)
            => voiceChannels.filter(filters.byName(name, ignoreCase));

    shared formal Role getRole(String id) ;

    shared formal {Role*} roles;

    shared default {Role*} rolesWithName(String name, Boolean ignoreCase = false)
            => roles.filter(filters.byName(name, ignoreCase));

    shared formal Role publicRole;

    shared formal Emote getEmote(String id) ;

    shared formal {Emote*} emotes;

    shared default {Emote*} emotesWithName(String name, Boolean ignoreCase = false)
            => emotes.filter(filters.byName(name, ignoreCase));

    shared formal Promise<{User*}> bans;

    shared formal Promise<Integer> prunableMemberCount(Integer days) ;

    shared formal Promise<Nothing> leave() ;

    shared formal Promise<Nothing> delete(String? mfaCode = null) ;

    shared formal Promise<{Webhook*}> webhooks;

    shared formal {GuildVoiceState*} voiceStates;

    shared formal VerificationLevel? verificationLevel;

    shared formal NotificationLevel? defaultNotificationLevel;

    shared formal MFALevel? requiredMfaLevel;

    shared formal ExplicitContentLevel? explicitContentLevel;

    shared actual Boolean available => true;
}

shared interface UnavailableGuild satisfies Guildlike {

    shared actual Boolean available => false;
}

shared class AfkTimeout of seconds60 | seconds300 | seconds900 | seconds1800 | seconds3600 {

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