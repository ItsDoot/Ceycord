shared abstract class MFALevel of none | elevated {

    shared static object none extends MFALevel(0) {
        string => "none";
    }

    shared static object elevated extends MFALevel(1) {
        string => "elevated";
    }

    shared static MFALevel|ParseException parse(String string) =>
            parseMFALevel(string) else ParseException("illegal format for MFALevel");

    shared Integer id;

    shared new (Integer id) {
        this.id = id;
    }

    hash => id.hash;
}

see (`function MFALevel.parse`)
shared MFALevel? parseMFALevel(String string) =>
        switch (string)
        case ("none") MFALevel.none
        case ("elevated") MFALevel.elevated
        else null;