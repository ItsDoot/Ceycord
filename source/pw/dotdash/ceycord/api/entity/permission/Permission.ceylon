shared abstract class Permission of createInstantInvite | kickMembers | banMembers | administrator | manageChannels |
        manageGuild | addReactions | viewAuditLog | viewChannel | readMessages | sendMessages | sendTtsMessages |
        manageMessages | embedLinks | attachFiles | readMessageHistory | mentionEveryone | useExternalEmojis | connect |
        speak | muteMembers | deafenMembers | moveMembers | useVad | changeNickname | manageNicknames | manageRoles |
        managePermissions | manageWebhooks | manageEmojis {

    shared static object createInstantInvite extends Permission(0, true, true, "Create Instant Invite") {
        string => "createInstantInvite";
    }

    shared static object kickMembers extends Permission(1, true, false, "Kick Members") {
        string => "kickMembers";
    }

    shared static object banMembers extends Permission(2, true, false, "Ban Members") {
        string => "banMembers";
    }

    shared static object administrator extends Permission(3, true, false, "Administrator") {
        string => "administrator";
    }

    shared static object manageChannels extends Permission(4, true, true, "Manage Channels") {
        string => "manageChannels";
    }

    shared static object manageGuild extends Permission(5, true, false, "Manage Server") {
        string => "manageGuild";
    }

    shared static object addReactions extends Permission(6, true, true, "Add Reactions") {
        string => "addReactions";
    }

    shared static object viewAuditLog extends Permission(7, true, false, "View Audit Log") {
        string => "viewAuditLog";
    }

    shared static object viewChannel extends Permission(10, true, true, "View Channel") {
        string => "viewChannel";
    }

    shared static object readMessages extends Permission(10, true, true, "Read Messages") {
        string => "readMessages";
    }

    shared static object sendMessages extends Permission(11, true, true, "Send Messages") {
        string => "sendMessages";
    }

    shared static object sendTtsMessages extends Permission(12, true, true, "Send TTS Messages") {
        string => "sendTtsMessages";
    }

    shared static object manageMessages extends Permission(13, true, true, "Manage Messages") {
        string => "manageMessages";
    }

    shared static object embedLinks extends Permission(14, true, true, "Embed Links") {
        string => "embedLinks";
    }

    shared static object attachFiles extends Permission(15, true, true, "attach Files") {
        string => "attachFiles";
    }

    shared static object readMessageHistory extends Permission(16, true, true, "Read Message History") {
        string => "readMessageHistory";
    }

    shared static object mentionEveryone extends Permission(17, true, true, "Mention Everyone") {
        string => "mentionEveryone";
    }

    shared static object useExternalEmojis extends Permission(18, true, true, "Use External Emojis") {
        string => "useExternalEmojis";
    }

    shared static object connect extends Permission(20, true, true, "Connect") {
        string => "connect";
    }

    shared static object speak extends Permission(21, true, true, "Speak") {
        string => "speak";
    }

    shared static object muteMembers extends Permission(22, true, true, "Mute Members") {
        string => "muteMembers";
    }

    shared static object deafenMembers extends Permission(23, true, true, "Deafen Members") {
        string => "deafenMembers";
    }

    shared static object moveMembers extends Permission(24, true, true, "Move Members") {
        string => "moveMembers";
    }

    shared static object useVad extends Permission(25, true, true, "Use VAD") {
        string => "useVad";
    }

    shared static object changeNickname extends Permission(26, true, false, "Change Nickname") {
        string => "changeNickname";
    }

    shared static object manageNicknames extends Permission(27, true, false, "Manage Nicknames") {
        string => "manageNicknames";
    }

    shared static object manageRoles extends Permission(28, true, false, "Manage Roles") {
        string => "manageRoles";
    }

    shared static object managePermissions extends Permission(28, false, true, "Manage Permissions") {
        string => "managePermissions";
    }

    shared static object manageWebhooks extends Permission(29, true, true, "Manage Webhooks") {
        string => "manageWebhooks";
    }

    shared static object manageEmojis extends Permission(30, true, false, "Manage Emojis") {
        string => "manageEmojis";
    }

    shared static {Permission*} allPermissions = permissions;

    shared static {Permission*} guildPermisisons = allPermissions.filter((perm) => perm.guild);

    shared static {Permission*} channelPermissions = allPermissions.filter((perm) => perm.channel);

    shared static {Permission*} textPermissions = allPermissions.filter((perm) => perm.text);

    shared static {Permission*} voicePermissions = allPermissions.filter((perm) => perm.voice);

    shared static Permission|ParseException parse(String string) =>
            allPermissions.find((perm) => perm.string == string || perm.name == string) else ParseException("illegal format for Permission");

    shared static Permission|ParseException parseOffset(Integer offset) =>
            allPermissions.find((perm) => perm.offset == offset) else ParseException("illegal format for Permission");

    shared static {Permission*} fromRaw(Integer raw) =>
            allPermissions.filter((perm) => raw.and(perm.raw) == perm.raw);

    shared static Integer toRaw({Permission*} permissions) =>
            allPermissions.fold(0)((Integer partial, Permission element) => partial.or(element.raw));

    shared Integer offset;
    shared Boolean guild;
    shared Boolean channel;
    shared String name;

    shared new (Integer offset, Boolean guild, Boolean channel, String name) {
        this.offset = offset;
        this.guild = guild;
        this.channel = channel;
        this.name = name;
    }

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