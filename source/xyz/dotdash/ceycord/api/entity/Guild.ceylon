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

    shared formal actual Boolean contains(User user);

    shared formal GuildMember getMember(User|String user);

    shared formal {GuildMember+} members;

    shared formal GuildTextChannel getTextChannel(String id);

    shared formal {GuildTextChannel+} textChannels;

    shared formal GuildTextChannel publicChannel;

    shared formal GuildVoiceChannel getVoiceChannel(String id);

    shared formal {GuildVoiceChannel*} voiceChannels;

    shared formal Role getRole(String id);

    shared formal {Role*} roles;

    shared formal Role publicRole;

    shared formal Promise<Nothing> leave();

    shared formal Promise<Nothing> delete(String? mfaCode = null);

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

shared class Region {

    shared String key;
    shared String name;
    shared Boolean vip;

    abstract new region(String key, String name) {
        this.key = key;
        this.name = name;
        this.vip = false;
    }

    abstract new vipRegion(String key, String name) {
        this.key = "vip-" + key;
        this.name = name + " (VIP)";
        this.vip = true;
    }

    shared new amsterdam extends region("amsterdam", "Amsterdam") {}
    shared new brazil extends region("brazil", "Brazil") {}
    shared new euWest extends region("eu-west", "EU West") {}
    shared new euCentral extends region("eu-central", "EU Central") {}
    shared new frankfurt extends region("frankfurt", "Frankfurt") {}
    shared new hongKong extends region("hongkong", "Hong Kong") {}
    shared new london extends region("london", "London") {}
    shared new russia extends region("russia", "Russia") {}
    shared new singapore extends region("singapore", "Singapore") {}
    shared new sydney extends region("sydney", "Sydney") {}
    shared new usEast extends region("us-east", "US East") {}
    shared new usWest extends region("us-west", "US West") {}
    shared new usCentral extends region("us-central", "US Central") {}
    shared new usSouth extends region("us-south", "US South") {}

    shared new vipAmsterdam extends vipRegion("amsterdam", "Amsterdam") {}
    shared new vipBrazil extends vipRegion("brazil", "Brazil") {}
    shared new vipEuWest extends vipRegion("eu-west", "EU West") {}
    shared new vipEuCentral extends vipRegion("eu-central", "EU Central") {}
    shared new vipFrankfurt extends vipRegion("frankfurt", "Frankfurt") {}
    shared new vipHongKong extends vipRegion("hongkong", "Hong Kong") {}
    shared new vipLondon extends vipRegion("london", "London") {}
    shared new vipRussia extends vipRegion("russia", "Russia") {}
    shared new vipSingapore extends vipRegion("singapore", "Singapore") {}
    shared new vipSydney extends vipRegion("sydney", "Sydney") {}
    shared new vipUsEast extends vipRegion("us-east", "US East") {}
    shared new vipUsWest extends vipRegion("us-west", "US West") {}
    shared new vipUsCentral extends vipRegion("us-central", "US Central") {}
    shared new vipUsSouth extends vipRegion("us-south", "US South") {}

    shared new unknown extends region("", "Unknown") {}
}