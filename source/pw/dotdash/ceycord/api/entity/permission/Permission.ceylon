shared class Permission of createInstantInvite | kickMembers | banMembers | administrator | manageChannels |
        manageGuild | addReactions | viewAuditLog | viewChannel | readMessages | sendMessages | sendTtsMessages |
        manageMessages | embedLinks | attachFiles | readMessageHistory | mentionEveryone | useExternalEmojis | connect |
        speak | muteMembers | deafenMembers | moveMembers | useVad | changeNickname | manageNicknames | manageRoles |
        managePermissions | manageWebhooks | manageEmojis {

    shared static {Permission*} values = permissions;

    shared static {Permission*} guildValues = values.filter((perm) => perm.guild);

    shared static {Permission*} channelValues = values.filter((perm) => perm.channel);

    shared static {Permission*} textValues = values.filter((perm) => perm.text);

    shared static {Permission*} voiceValues = values.filter((perm) => perm.voice);

    shared static Permission|ParseException parse(String string) =>
            values.find((perm) => perm.string == string || perm.name == string) else ParseException("illegal format for Permission");

    shared static Permission|ParseException parseOffset(Integer offset) =>
            values.find((perm) => perm.offset == offset) else ParseException("illegal format for Permission");

    shared static {Permission*} fromRaw(Integer raw) =>
            values.filter((perm) => raw.and(perm.raw) == perm.raw);

    shared static Integer toRaw({Permission*} permissions) =>
            values.fold(0)((Integer partial, Permission element) => partial.or(element.raw));

    shared actual String string;
    shared Integer offset;
    shared Boolean guild;
    shared Boolean channel;
    shared String name;

    abstract new perm(String string, Integer offset, Boolean guild, Boolean channel, String name) {
        this.string = string;
        this.offset = offset;
        this.guild = guild;
        this.channel = channel;
        this.name = name;
    }

    shared new createInstantInvite extends perm("createInstantInvite", 0, true, true, "Create Instant Invite") {}
    shared new kickMembers extends perm("kickMembers", 1, true, false, "Kick Members") {}
    shared new banMembers extends perm("banMembers", 2, true, false, "Ban Members") {}
    shared new administrator extends perm("administrator", 3, true, false, "Administrator") {}
    shared new manageChannels extends perm("manageChannels", 4, true, true, "Manage Channels") {}
    shared new manageGuild extends perm("manageGuild", 5, true, false, "Manage Server") {}
    shared new addReactions extends perm("addReactions", 6, true, true, "Add Reactions") {}
    shared new viewAuditLog extends perm("viewAuditLog", 7, true, false, "View Audit Log") {}
    shared new viewChannel extends perm("viewChannel", 10, true, true, "View Channel") {}
    shared new readMessages extends perm("readMessages", 10, true, true, "Read Messages") {}
    shared new sendMessages extends perm("sendMessages", 11, true, true, "Send Messages") {}
    shared new sendTtsMessages extends perm("sendTtsMessages", 12, true, true, "Send TTS Messages") {}
    shared new manageMessages extends perm("manageMessages", 13, true, true, "Manage Messages") {}
    shared new embedLinks extends perm("embedLinks", 14, true, true, "Embed Links") {}
    shared new attachFiles extends perm("attachFiles", 15, true, true, "Attach Files") {}
    shared new readMessageHistory extends perm("readMessageHistory", 16, true, true, "Read Message History") {}
    shared new mentionEveryone extends perm("mentionEveryone", 17, true, true, "Mention Everyone") {}
    shared new useExternalEmojis extends perm("useExternalEmojis", 18, true, true, "Use External Emojis") {}
    shared new connect extends perm("connect", 20, true, true, "Connect") {}
    shared new speak extends perm("speak", 21, true, true, "Speak") {}
    shared new muteMembers extends perm("muteMembers", 22, true, true, "Mute Members") {}
    shared new deafenMembers extends perm("deafenMembers", 23, true, true, "Deafen Members") {}
    shared new moveMembers extends perm("moveMembers", 24, true, true, "Move Members") {}
    shared new useVad extends perm("useVad", 25, true, true, "Use VAD") {}
    shared new changeNickname extends perm("changeNickname", 26, true, false, "Change Nickname") {}
    shared new manageNicknames extends perm("manageNicknames", 27, true, false, "Manage Nicknames") {}
    shared new manageRoles extends perm("manageRoles", 28, true, false, "Manage Roles") {}
    shared new managePermissions extends perm("managePermissions", 28, false, true, "Manage Permissions") {}
    shared new manageWebhooks extends perm("manageWebhooks", 29, true, true, "Manage Webhooks") {}
    shared new manageEmojis extends perm("manageEmojis", 30, true, false, "Manage Emojis") {}

    shared Integer raw = 1.leftLogicalShift(offset);

    shared Boolean text = 9<offset<20;

    shared Boolean voice = offset == 10 || 19<offset<26;

    hash => offset.hash;
}

shared {Permission*} permissions = {
    Permission.createInstantInvite,
    Permission.kickMembers,
    Permission.banMembers,
    Permission.administrator,
    Permission.manageChannels,
    Permission.manageGuild,
    Permission.addReactions,
    Permission.viewAuditLog,
    Permission.viewChannel,
    Permission.sendMessages,
    Permission.sendTtsMessages,
    Permission.manageMessages,
    Permission.embedLinks,
    Permission.attachFiles,
    Permission.readMessageHistory,
    Permission.mentionEveryone,
    Permission.useExternalEmojis,
    Permission.connect,
    Permission.speak,
    Permission.muteMembers,
    Permission.deafenMembers,
    Permission.moveMembers,
    Permission.useVad,
    Permission.changeNickname,
    Permission.manageNicknames,
    Permission.manageRoles,
    Permission.manageWebhooks,
    Permission.manageEmojis
};