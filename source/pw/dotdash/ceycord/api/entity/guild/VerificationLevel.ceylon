shared class VerificationLevel of none | low | medium | high | veryHigh {

    shared static VerificationLevel|ParseException parse(String|Integer stringOrId) =>
            parseVerificationLevel(stringOrId) else ParseException("illegal format for VerificationLevel");

    shared Integer id;
    shared actual String string;
    shared String name;

    abstract new level(Integer id, String string, String name) {
        this.id = id;
        this.string = string;
        this.name = name;
    }

    shared new none extends level(0, "none", "None") {}

    shared new low extends level(1, "low", "Low") {}

    shared new medium extends level(2, "medium", "Medium") {}

    shared new high extends level(3, "high", "High") {}

    shared new veryHigh extends level(4, "veryHigh", "Very High") {}

    hash = id.hash;
}

see (`function VerificationLevel.parse`)
shared VerificationLevel? parseVerificationLevel(String|Integer stringOrId) =>
        switch (stringOrId)
        case (0|"none"|"None") VerificationLevel.none
        case (1|"low"|"Low") VerificationLevel.low
        case (2|"medium"|"Medium") VerificationLevel.medium
        case (3|"high"|"High") VerificationLevel.high
        case (4|"veryHigh"|"Very High") VerificationLevel.veryHigh
        else null;