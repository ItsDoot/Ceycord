import ceylon.json {
    JsonObject
}

import xyz.dotdash.ceycord.api {
    Client,
    Permission
}
import xyz.dotdash.ceycord.api.entity {
    Role,
    Guild
}

shared abstract class CeylonRole satisfies Role {

    shared actual Client client;
    shared actual Guild guild;

    shared actual String id;
    shared actual String name;
    shared actual Integer? color;
    shared actual Boolean hoisted;
    shared actual Integer position;
    shared actual {Permission*} permissions;
    shared actual Boolean managed;
    shared actual Boolean mentionable;

    shared actual Boolean publicRole;

    shared new (Guild guild, JsonObject obj) {
        this.client = guild.client;
        this.guild = guild;

        this.id = obj.getString("id");
        this.name = obj.getString("name");
        this.color = if (obj.getInteger("color") != 0) then obj.getInteger("color") else null;
        this.hoisted = obj.getBoolean("hoisted");
        this.position = obj.getInteger("position");
        this.permissions = Permission.fromRaw(obj.getInteger("permissions"));
        this.managed = obj.getBoolean("managed");
        this.mentionable = obj.getBoolean("mentionable");

        this.publicRole = this.id == guild.publicRole.id;
    }

    shared actual Comparison compare(Role other) {
        if (this == other) {
            return equal;
        }

        "Can't compare roles that aren't in the same server!"
        assert (this.guild == other.guild);

        return this.position.compare(other.position);
    }

    equals(Object that) => if (is CeylonRole that) then this.id == that.id else false;

    hash => id.hash;

    string => "Role(``id``)";
}