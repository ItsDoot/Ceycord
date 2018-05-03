shared abstract class UserStatus of online | idle | doNotDisturb | invisible | offline {

    "A value representing online status for a [[pw.dotdash.ceycord.api.entity.user::User]]."
    shared static object online extends UserStatus() {
        string => "online";
    }

    "A value representing idle status for a [[pw.dotdash.ceycord.api.entity.user::User]]."
    shared static object idle extends UserStatus() {
        string => "idle";
    }

    "A value representing do-not-disturb status for a [[pw.dotdash.ceycord.api.entity.user::User]]."
    shared static object doNotDisturb extends UserStatus() {
        string => "dnd";
    }

    "A value representing invisible status for a [[pw.dotdash.ceycord.api.entity.user::User]]."
    shared static object invisible extends UserStatus() {
        string => "invisible";
    }

    "A value representing offline status for a [[pw.dotdash.ceycord.api.entity.user::User]]."
    shared static object offline extends UserStatus() {
        string => "offline";
    }

    shared static UserStatus|ParseException parse(String string) =>
            parseUserStatus(string) else ParseException("illegal format for UserStatus");

    shared new () {}
}

see (`function UserStatus.parse`)
shared UserStatus? parseUserStatus(String string) =>
        switch (string)
        case ("online") UserStatus.online
        case ("idle") UserStatus.idle
        case ("dnd") UserStatus.doNotDisturb
        case ("invisible") UserStatus.invisible
        case ("offline") UserStatus.offline
        else null;