shared abstract class ContentFilterLevel of disabled | withoutRoles | allMembers {

    shared static object disabled extends ContentFilterLevel(0) {
        string => "disabled";
    }

    shared static object withoutRoles extends ContentFilterLevel(1) {
        string => "withoutRoles";
    }

    shared static object allMembers extends ContentFilterLevel(2) {
        string => "allMembers";
    }

    shared static ContentFilterLevel|ParseException parse(String string) =>
            parseContentFilterLevel(string) else ParseException("illegal format for ContentFilterLevel");

    shared Integer id;

    shared new (Integer id) {
        this.id = id;
    }

    hash => id.hash;
}

see (`function ContentFilterLevel.parse`)
shared ContentFilterLevel? parseContentFilterLevel(String string) =>
        switch(string)
        case ("disabled") ContentFilterLevel.disabled
        case ("withoutRoles") ContentFilterLevel.withoutRoles
        case ("allMembers") ContentFilterLevel.allMembers
        else null;