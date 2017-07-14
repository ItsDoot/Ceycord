shared class Permission of createInstantInvite | kickMembers | banMembers | administrator | manageChannels |
        manageServer | addReactions | viewAuditLogs | readMessages | sendMessages | sendTtsMessages | manageMessages |
        embedLinks | attachFiles | readMessageHistory | mentionEveryone | useExternalEmojis | connect | speak |
        muteMembers | deafenMembers | moveMembers | useVad | changeNickname | manageNicknames | manageRoles |
        managePermissions | manageWebhooks | manageEmojis {

    shared static {Permission*} permissions => `Permission`.caseValues;

    shared static {Permission*} channelPermissions => permissions.filter((perm) => perm.channel);

    shared static {Permission*} guildPermissions => permissions.filter((perm) => perm.guild);

    shared static {Permission*} textPermissions => permissions.filter((perm) => perm.text);

    shared static {Permission*} voicePermissions => permissions.filter((perm) => perm.voice);

    shared static Permission? fromOffset(Integer offset)
            => permissions.find((perm) => perm.offset == offset);

    shared static {Permission*} fromRaw(Integer raw)
            => permissions.filter((perm) => raw.rightLogicalShift(perm.offset).and(1) == 1);

    shared static Integer toRaw({Permission*} permissions)
            => permissions.fold(0)((Integer partial, Permission perm) => partial.or(perm.raw));

    shared Integer offset;
    shared Boolean guild;
    shared Boolean channel;
    shared String name;

    abstract new perm(Integer offset, Boolean guild, Boolean channel, String name) {
        this.offset = offset;
        this.guild = guild;
        this.channel = channel;
        this.name = name;
    }

    abstract new both(Integer offset, String name) extends perm(offset, true, true, name) {}

    abstract new guildPerm(Integer offset, String name) extends perm(offset, true, false, name) {}

    abstract new channelPerm(Integer offset, String name) extends perm(offset, false, true, name) {}

    shared new createInstantInvite extends both(0, "Create Instant Invite") {}

    shared new kickMembers extends guildPerm(1, "Kick Members") {}

    shared new banMembers extends guildPerm(2, "Ban Members") {}

    shared new administrator extends guildPerm(3, "Administrator") {}

    shared new manageChannels extends both(4, "Manage Channels") {}

    shared new manageServer extends guildPerm(5, "Manage Server") {}

    shared new addReactions extends both(6, "Add Reactions") {}

    shared new viewAuditLogs extends guildPerm(7, "View Audit Logs") {}

    shared new readMessages extends both(10, "Read Messages") {}

    shared new sendMessages extends both(11, "Send Messages") {}

    shared new sendTtsMessages extends both(12, "Send TTS Messages") {}

    shared new manageMessages extends both(13, "Manage Messages") {}

    shared new embedLinks extends both(14, "Embed Links") {}

    shared new attachFiles extends both(15, "Attach Files") {}

    shared new readMessageHistory extends both(16, "Read Message History") {}

    shared new mentionEveryone extends both(17, "Mention Everyone") {}

    shared new useExternalEmojis extends both(18, "Use External Emojis") {}

    shared new connect extends both(20, "Connect") {}

    shared new speak extends both(21, "Speak") {}

    shared new muteMembers extends both(22, "Mute Members") {}

    shared new deafenMembers extends both(23, "Deafen Members") {}

    shared new moveMembers extends both(24, "Move Members") {}

    shared new useVad extends both(25, "Use Voice Activity") {}

    shared new changeNickname extends guildPerm(26, "Change Nickname") {}

    shared new manageNicknames extends guildPerm(27, "Manage Nicknames") {}

    shared new manageRoles extends guildPerm(28, "Manage Roles") {}

    shared new managePermissions extends channelPerm(28, "Manage Permissions") {}

    shared new manageWebhooks extends both(29, "Manage Webhooks") {}

    shared new manageEmojis extends guildPerm(30, "Manage Emojis") {}

    shared Integer raw => 1.leftLogicalShift(offset);

    shared Boolean text => 9<offset<20;

    shared Boolean voice => 19<offset<26;
}