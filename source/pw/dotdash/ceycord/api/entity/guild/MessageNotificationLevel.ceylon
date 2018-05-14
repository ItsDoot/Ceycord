shared class NotificationLevel of allMessages | onlyMentions {

    shared static NotificationLevel|ParseException parse(String|Integer stringOrId) =>
            parseNotificationLevel(stringOrId) else ParseException("illegal format for NotificationLevel");

    shared Integer id;
    shared actual String string;
    shared String name;

    abstract new level(Integer id, String string, String name) {
        this.id = id;
        this.string = string;
        this.name = name;
    }

    shared new allMessages extends level(0, "allMessages", "All Messages") {}

    shared new onlyMentions extends level(1, "onlyMentions", "Only Mentions") {}

    hash = id.hash;
}

see (`function NotificationLevel.parse`)
shared NotificationLevel? parseNotificationLevel(String|Integer stringOrId) =>
        switch (stringOrId)
        case (0|"allMessages"|"All Messages") NotificationLevel.allMessages
        case (1|"onlyMentions"|"Only Mentions") NotificationLevel.onlyMentions
        else null;