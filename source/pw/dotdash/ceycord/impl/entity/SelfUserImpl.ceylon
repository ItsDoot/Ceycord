import pw.dotdash.ceycord.api {
    Ceycord
}
import pw.dotdash.ceycord.api.entity.user {
    SelfUser
}

shared class SelfUserImpl extends UserImpl satisfies SelfUser {

    shared actual variable Boolean? verified;

    shared actual variable String? email;

    shared new (Ceycord ceycord, String id, String name, String discriminator, String? avatar, Boolean bot, Boolean mfaEnabled,
            Boolean? verified, String? email) extends UserImpl(ceycord, id, name, discriminator, avatar, bot, mfaEnabled) {
        this.verified = verified;
        this.email = email;
    }
}