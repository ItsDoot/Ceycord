import pw.dotdash.ceycord.api {
    Ceycord
}
import pw.dotdash.ceycord.api.entity.channel {
    GuildVoiceChannel
}
import pw.dotdash.ceycord.api.entity.guild {
    Guild,
    ContentFilterLevel,
    NotificationLevel,
    MFALevel,
    GuildMember,
    VerificationLevel,
    Region,
    Role
}

shared class GuildImpl(ceycord, id, name, icon, splash, owner, region, embedded, embedChannel, verificationLevel,
        defaultNotificationLevel, contentFilterLevel, mfaLevel, features, applicationId)
        satisfies Guild {

    shared actual Ceycord ceycord;
    shared actual String id;
    shared actual String name;
    shared actual String? icon;
    shared actual String? splash;
    shared actual GuildMember owner;
    shared actual Region? region;
    shared actual Boolean embedded;
    shared actual GuildVoiceChannel embedChannel;
    shared actual VerificationLevel? verificationLevel;
    shared actual NotificationLevel? defaultNotificationLevel;
    shared actual ContentFilterLevel? contentFilterLevel;
    shared actual MFALevel? mfaLevel;
    shared actual Set<String> features;
    shared actual String? applicationId;
    shared actual Boolean large => nothing;
    shared actual {Role*} roles => nothing;
    shared actual Integer size => nothing;



    shared actual Role? getRoleById(String|Integer id) => nothing;

    iconUrl = if (exists icon) then "https://cdn.discordapp.com/icons/``id``/``icon``.jpg" else null;

    splashUrl = if (exists splash) then "https://cdn.discordapp.com/splashes/``id``/``splash``.jpg" else null;
}