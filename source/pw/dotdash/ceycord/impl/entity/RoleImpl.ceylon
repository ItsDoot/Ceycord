import ceylon.json {
    JsonObject
}
import ceylon.promise {
    Promise
}

import pw.dotdash.ceycord.api {
    Ceycord
}
import pw.dotdash.ceycord.api.entity.guild {
    Role,
    Guild,
    GuildMember
}
import pw.dotdash.ceycord.api.entity.permission {
    Permission
}
import pw.dotdash.ceycord.api.util {
    Property
}
import pw.dotdash.ceycord.impl.util {
    ParsingContext
}

shared class RoleImpl satisfies Role & Jsonable {

    shared actual Ceycord ceycord;
    shared actual Guild guild;
    shared actual String id;
    shared actual String name;
    shared actual Integer color;
    shared actual Boolean hoisted;
    shared actual Integer position;
    shared actual Set<Permission> permissions;
    shared actual Boolean managed;
    shared actual Boolean mentionable;

    shared new fromJson(ParsingContext ctx, JsonObject json) {
        this.ceycord = ctx.ceycord;
        this.guild = ctx.require<Guild>("guild");
        this.id = json.getString("id");
        this.name = json.getString("name");
        this.color = json.getInteger("color");
        this.hoisted = json.getBoolean("hoist");
        this.position = json.getInteger("position");
        this.permissions = set(Permission.fromRaw(json.getInteger("permissions")));
        this.managed = json.getBoolean("managed");
        this.mentionable = json.getBoolean("mentionable");
    }

    shared actual Boolean everyone = this.id == guild.id;

    shared actual Promise<Null> delete() => nothing;

    shared actual {GuildMember*} members => nothing;

    shared actual Promise<Role> update(
            Property<String> name,
            Property<Integer> position,
            Property<Integer> color,
            Property<Boolean> mentionable,
            Property<Boolean> hoisted) => nothing;

    shared actual JsonObject json => JsonObject {
        "id"->this.id,
        "name"->this.name,
        "color"->this.color,
        "hoist"->this.hoisted,
        "position"->this.position,
        "permissions"->Permission.toRaw(permissions),
        "managed"->this.managed,
        "mentionable"->this.mentionable
    };
}