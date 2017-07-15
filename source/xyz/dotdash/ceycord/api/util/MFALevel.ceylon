shared class MFALevel of none | twoFactorAuth satisfies Comparable<MFALevel> {

    shared static MFALevel? with(Integer id) => `MFALevel`.caseValues.find((level) => level.id == id);

    shared Integer id;

    shared new none {
        this.id = 0;
    }

    shared new twoFactorAuth {
        this.id = 1;
    }

    compare(MFALevel other) => this.id <=> other.id;
}