import pw.dotdash.ceycord.api.entity.permission {
    Role
}
import pw.dotdash.ceycord.api.entity.user {
    User
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

    shared formal GuildMember owner;

    shared formal User ownerUser;

    shared formal Integer? applicationId;

    "The features of the [[Guild]].

     Known features:
     - `INVITE_SPLASH`
     - `MORE_EMOJI`
     - `VANITY_URL`
     - `VERIFIED`
     - `VIP_REGIONS`"
    shared formal Set<String> features;

    // TODO : region

    shared formal VerificationLevel verificationLevel;

    shared formal NotificationLevel defaultNotificationLevel;

    shared formal ContentFilterLevel contentFilterLevel;

    shared formal MFALevel mfaLevel;

    shared formal Boolean large;

    shared actual Boolean available => true;

    shared formal Integer size;

    shared formal {Role*} roles;

    shared formal Role? getRoleById(String|Integer id) ;

    shared default {Role*} getRolesByName(String name, Boolean ignoreCase) =>
            let (equals = ignoreCase then name.equalsIgnoringCase else name.equals)
            roles.filter((role) => equals(role.name));
}