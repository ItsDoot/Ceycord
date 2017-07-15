import xyz.dotdash.ceycord.api.entity {
    Guild,
    AfkTimeout
}
import xyz.dotdash.ceycord.api.entity.channel {
    GuildVoiceChannel
}
import xyz.dotdash.ceycord.api.util {
    Region,
    VerificationLevel,
    NotificationLevel,
    MFALevel,
    ExplicitContentLevel
}

shared interface GuildManager satisfies Manager<GuildManager,Guild> {

    shared formal variable String name;

    shared formal variable Region region;

    shared formal variable GuildVoiceChannel afkChannel;

    shared formal variable AfkTimeout afkTimeout;

    shared formal variable VerificationLevel? verificationLevel;

    shared formal variable NotificationLevel? defaultNotificationLevel;

    shared formal variable MFALevel? requiredMfaLevel;

    shared formal variable ExplicitContentLevel? explicitContentLevel;
}