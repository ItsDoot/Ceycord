import ceylon.promise {
    Promise
}

import pw.dotdash.ceycord.api.entity {
    Mentionable,
    Unique
}
import pw.dotdash.ceycord.api.entity.guild {
    Guild,
    GuildMember
}
import pw.dotdash.ceycord.api.util {
    Property,
    unchanged
}

shared interface Role satisfies Unique & Mentionable & Comparable<Role> & Category<Permission> {

    "Returns the [[Guild]] the role belongs to."
    shared formal Guild guild;

    "Returns the name of the role."
    shared formal String name;

    "Returns the hierarchical position of the role."
    shared formal Integer position;

    "Returns the color of the role."
    shared formal Integer color;

    "Returns true if the role is mentionable by `@Role`."
    shared formal Boolean mentionable;

    "Returns true if the role is pinned in the member listing."
    shared formal Boolean hoisted;

    "Returns true if the role is managed by an integration."
    shared formal Boolean managed;

    "Returns true if the role is the `@everyone` role."
    shared formal Boolean everyone;

    shared formal Set<Permission> permissions;

    shared formal {GuildMember*} members;

    shared formal Promise<Role> update(
            Property<String> name = unchanged,
            Property<Integer> position = unchanged,
            Property<Integer> color = unchanged,
            Property<Boolean> mentionable = unchanged,
            Property<Boolean> hoisted = unchanged) ;

    shared formal Promise<Null> delete() ;

    shared actual String mention => "<@&``id``>";

    shared actual Comparison compare(Role other) => this.position.compare(other.position);

    shared actual Boolean contains(Permission element) => element in permissions;
}