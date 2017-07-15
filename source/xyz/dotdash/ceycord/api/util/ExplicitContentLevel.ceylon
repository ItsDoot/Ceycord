shared class ExplicitContentLevel of off | noRole | all satisfies Comparable<ExplicitContentLevel> {

    shared static ExplicitContentLevel? with(Integer id) => `ExplicitContentLevel`.caseValues.find((level) => level.id == id);

    shared Integer id;

    shared new off {
        this.id = 0;
    }

    shared new noRole {
        this.id = 1;
    }

    shared new all {
        this.id = 2;
    }

    compare(ExplicitContentLevel other) => this.id <=> other.id;
}