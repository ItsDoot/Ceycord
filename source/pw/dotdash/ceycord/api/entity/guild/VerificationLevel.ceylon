shared abstract class VerificationLevel of none | low | medium | high | veryHigh {

    shared static object none extends VerificationLevel(0) {
        string => "none";
    }

    shared static object low extends VerificationLevel(1) {
        string => "low";
    }

    shared static object medium extends VerificationLevel(2) {
        string => "medium";
    }

    shared static object high extends VerificationLevel(3) {
        string => "high";
    }

    shared static object veryHigh extends VerificationLevel(4) {
        string => "veryHigh";
    }

    shared static VerificationLevel|ParseException parse(String string) =>
            parseVerificationLevel(string) else ParseException("illegal format for VerificationLevel");

    shared Integer id;

    shared new (Integer id) {
        this.id = id;
    }

    hash => id.hash;
}

see (`function VerificationLevel.parse`)
shared VerificationLevel? parseVerificationLevel(String|Integer stringOrId) =>
        switch (stringOrId)
        case ("none"|0) VerificationLevel.none
        case ("low"|1) VerificationLevel.low
        case ("medium"|2) VerificationLevel.medium
        case ("high"|3) VerificationLevel.high
        case ("veryHigh"|4) VerificationLevel.veryHigh
        else null;