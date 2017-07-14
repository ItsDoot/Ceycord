import xyz.dotdash.ceycord.api {
    Permission
}
import xyz.dotdash.ceycord.api.entity.channel {
    Channel
}

shared interface PermissionHolder satisfies GuildLinked & Category<Permission> {

    shared formal {Permission*} permissions;

    shared default actual Boolean contains(Permission perm) => perm in permissions;

    shared formal Boolean channelContains(Channel channel, Permission perm) ;
}