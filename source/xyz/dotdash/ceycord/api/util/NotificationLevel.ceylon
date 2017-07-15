shared class NotificationLevel of allMessages | mentionsOnly satisfies Comparable<NotificationLevel> {

    shared NotificationLevel? with(Integer id) => `NotificationLevel`.caseValues.find((level) => level.id == id);

    shared Integer id;

    shared new allMessages {
        this.id = 0;
    }

    shared new mentionsOnly {
        this.id = 1;
    }

    compare(NotificationLevel other) => this.id <=> other.id;
}