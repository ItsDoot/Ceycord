import pw.dotdash.ceycord.api.util {
    Property
}

shared interface UserUpdateEvent satisfies UserEvent {

    shared formal Property<String> name;

    shared formal Property<String> discriminator;

    shared formal Property<String?> avatar;
}