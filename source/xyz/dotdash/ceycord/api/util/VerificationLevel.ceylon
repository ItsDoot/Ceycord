shared class VerificationLevel of none | low | medium | high | veryHigh {

    shared static VerificationLevel? with(Integer id) => `VerificationLevel`.caseValues.find((level) => level.id == id);

    shared Integer id;

    shared new none {
        this.id = 0;
    }

    shared new low {
        this.id = 1;
    }

    shared new medium {
        this.id = 2;
    }

    shared new high {
        this.id = 3;
    }

    shared new veryHigh {
        this.id = 4;
    }
}