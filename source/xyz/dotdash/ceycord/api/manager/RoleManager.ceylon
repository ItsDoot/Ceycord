import xyz.dotdash.ceycord.api.util {
    Permission
}
import xyz.dotdash.ceycord.api.entity {
    Role,
    GuildLinked
}

shared interface RoleManager satisfies Manager<RoleManager,Role> & GuildLinked {

    shared formal variable String name;

    shared formal variable Integer color;

    shared formal variable Boolean hoisted;

    shared formal variable Boolean mentionable;

    shared formal variable {Permission*} permissions;
}