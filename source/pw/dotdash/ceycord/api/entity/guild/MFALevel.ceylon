shared class MFALevel of none | elevated {

    shared static MFALevel|ParseException parse(String|Integer stringOrId) =>
            parseMFALevel(stringOrId) else ParseException("illegal format for MFALevel");

    shared Integer id;
    shared actual String string;
    shared String name;

    abstract new level(Integer id, String string, String name) {
        this.id = id;
        this.string = string;
        this.name = name;
    }

    shared new none extends level(0, "none", "None") {}

    shared new elevated extends level(1, "elevated", "Elevated") {}

    hash = id.hash;
}

see (`function MFALevel.parse`)
shared MFALevel? parseMFALevel(String|Integer stringOrId) =>
        switch (stringOrId)
        case (0|"none"|"None") MFALevel.none
        case (1|"elevated"|"Elevated") MFALevel.elevated
        else null;