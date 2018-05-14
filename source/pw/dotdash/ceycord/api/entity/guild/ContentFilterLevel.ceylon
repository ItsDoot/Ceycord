shared class ContentFilterLevel of disabled | withoutRoles | allMembers {

    shared static ContentFilterLevel|ParseException parse(String|Integer stringOrId) =>
            parseContentFilterLevel(stringOrId) else ParseException("illegal format for ContentFilterLevel");

    shared Integer id;
    shared actual String string;
    shared String name;

    abstract new level(Integer id, String string, String name) {
        this.id = id;
        this.string = string;
        this.name = name;
    }

    shared new disabled extends level(0, "disabled", "Disabled") {}

    shared new withoutRoles extends level(1, "withoutRoles", "Members Without Roles") {}

    shared new allMembers extends level(2, "allMembers", "All Members") {}

    hash = id.hash;
}

see (`function ContentFilterLevel.parse`)
shared ContentFilterLevel? parseContentFilterLevel(String|Integer stringOrId) =>
        switch (stringOrId)
        case (0|"disabled"|"Disabled") ContentFilterLevel.disabled
        case (1|"withoutRoles"|"Members Without Roles") ContentFilterLevel.withoutRoles
        case (2|"allMembers"|"All Members") ContentFilterLevel.allMembers
        else null;