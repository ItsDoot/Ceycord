import xyz.dotdash.ceycord.api.entity {
    GuildMember,
    Role,
    Nameable
}

shared object filters {

    shared Boolean(String)(String) testEquality(Boolean ignoreCase)
            => if (ignoreCase) then String.equalsIgnoringCase else String.equals;

    shared Boolean byName(String name, Boolean ignoreCase = false)(Nameable nameable)
            => testEquality(ignoreCase)(nameable.name)(name);

    shared object member {

        shared Boolean byName(String name, Boolean ignoreCase = false)(GuildMember member)
                => testEquality(ignoreCase)(member.user.name)(name);

        shared Boolean byNickname(String nickname, Boolean ignoreCase = false)(GuildMember member) {
            if (exists nick = member.nickname) {
                return testEquality(ignoreCase)(nick)(nickname);
            } else {
                return false;
            }
        }

        shared Boolean byEffectiveName(String effectiveName, Boolean ignoreCase = false)(GuildMember member)
                => testEquality(ignoreCase)(member.effectiveName)(effectiveName);

        shared Boolean byRoles({Role*} roles)(GuildMember member) {
            return member.roles.containsEvery(roles);
        }
    }
}