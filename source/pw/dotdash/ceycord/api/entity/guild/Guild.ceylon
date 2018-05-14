import pw.dotdash.ceycord.api.entity.channel {
    GuildVoiceChannel
}

shared interface Guild satisfies Guildlike {

    "The human readable name of the [[Guild]]."
    shared formal String name;

    "The hashed-id of the [[Guild]] image icon."
    shared formal String? icon;

    "The URL of the [[Guild]] image icon."
    shared formal String? iconUrl;

    "The hashed-id of the [[Guild]] image splash."
    shared formal String? splash;

    "The URL of the [[Guild]] image splash."
    shared formal String? splashUrl;

    "Whether the current user is the owner of the [[Guild]]."
    shared default Boolean selfOwner => owner.user == ceycord.selfUser;

    shared formal GuildMember owner;

    shared formal Region? region;

    shared formal Boolean embedded;

    shared formal GuildVoiceChannel embedChannel;

    shared formal VerificationLevel? verificationLevel;

    shared formal NotificationLevel? defaultNotificationLevel;

    shared formal ContentFilterLevel? contentFilterLevel;

    shared formal MFALevel? mfaLevel;

    "The features of the [[Guild]].

     Known features:
     - `INVITE_SPLASH`
     - `MORE_EMOJI`
     - `VANITY_URL`
     - `VERIFIED`
     - `VIP_REGIONS`"
    shared formal Set<String> features;

    shared formal String? applicationId;

    shared formal Boolean large;

    shared actual Boolean available => true;

    shared formal Integer size;

    shared formal {Role*} roles;

    shared formal Role? getRoleById(String|Integer id) ;

    shared default {Role*} getRolesByName(String name, Boolean ignoreCase) =>
            let (equals = ignoreCase then name.equalsIgnoringCase else name.equals)
            roles.filter((role) => equals(role.name));
}