shared class AuditLogType {

    shared static AuditLogType|ParseException parse(String|Integer stringOrId) =>
            parseAuditLogType(stringOrId) else ParseException("illegal format for AuditLogType");

    shared Integer id;
    shared actual String string;

    abstract new type(Integer id, String name) {
        this.id = id;
        this.string = name;
    }

    shared new guildUpdate extends type(1, "Guild Update") {}

    shared new channelCreate extends type(10, "Channel Create") {}
    shared new channelUpdate extends type(11, "Channel Update") {}
    shared new channelDelete extends type(12, "Channel Delete") {}
    shared new channelOverwriteCreate extends type(13, "Channel Overwrite Create") {}
    shared new channelOverwriteUpdate extends type(14, "Channel Overwrite Update") {}
    shared new channelOverwriteDelete extends type(15, "Channel Overwrite Delete") {}

    shared new memberKick extends type(20, "Member Kick") {}
    shared new memberPrune extends type(21, "Member Prune") {}
    shared new memberBanAdd extends type(22, "Member Ban Add") {}
    shared new memberBanRemove extends type(23, "Member Ban Remove") {}
    shared new memberUpdate extends type(24, "Member Update") {}
    shared new memberRoleUpdate extends type(25, "Member Role Update") {}

    shared new roleCreate extends type(30, "Role Create") {}
    shared new roleUpdate extends type(31, "Role Update") {}
    shared new roleDelete extends type(32, "Role Delete") {}

    shared new inviteCreate extends type(40, "Invite Create") {}
    shared new inviteUpdate extends type(41, "Invite Update") {}
    shared new inviteDelete extends type(42, "Invite Delete") {}

    shared new webhookCreate extends type(50, "Webhook Create") {}
    shared new webhookUpdate extends type(51, "Webhook Update") {}
    shared new webhookDelete extends type(52, "Webhook Delete") {}

    shared new emojiCreate extends type(60, "Emoji Create") {}
    shared new emojiUpdate extends type(61, "Emoji Update") {}
    shared new emojiDelete extends type(62, "Emoji Delete") {}

    shared new messageDelete extends type(72, "Message Delete") {}

    hash = id.hash;
}

see (`function AuditLogType.parse`)
shared AuditLogType? parseAuditLogType(String|Integer stringOrId) =>
        switch (stringOrId)
        case ("guildUpdate"|1) AuditLogType.guildUpdate
        case ("channelCreate"|10) AuditLogType.channelCreate
        case ("channelUpdate"|11) AuditLogType.channelUpdate
        case ("channelOverwriteCreate"|13) AuditLogType.channelOverwriteCreate
        case ("channelOverwriteUpdate"|14) AuditLogType.channelOverwriteUpdate
        case ("channelOverwriteDelete"|15) AuditLogType.channelOverwriteDelete
        case ("memberKick"|20) AuditLogType.memberKick
        case ("memberPrune"|21) AuditLogType.memberPrune
        case ("memberBanAdd"|22) AuditLogType.memberBanAdd
        case ("memberBanRemove"|23) AuditLogType.memberBanRemove
        case ("memberUpdate"|24) AuditLogType.memberUpdate
        case ("memberRoleUpdate"|25) AuditLogType.memberRoleUpdate
        case ("roleCreate"|30) AuditLogType.roleCreate
        case ("roleUpdate"|31) AuditLogType.roleUpdate
        case ("roleDelete"|32) AuditLogType.roleDelete
        case ("inviteCreate"|40) AuditLogType.inviteCreate
        case ("inviteUpdate"|41) AuditLogType.inviteUpdate
        case ("inviteDelete"|42) AuditLogType.inviteDelete
        case ("webhookCreate"|50) AuditLogType.webhookCreate
        case ("webhookUpdate"|51) AuditLogType.webhookUpdate
        case ("webhookDelete"|52) AuditLogType.webhookDelete
        case ("emojiCreate"|60) AuditLogType.emojiCreate
        case ("emojiUpdate"|61) AuditLogType.emojiUpdate
        case ("emojiDelete"|62) AuditLogType.emojiDelete
        case ("messageDelete"|72) AuditLogType.messageDelete
        else null;