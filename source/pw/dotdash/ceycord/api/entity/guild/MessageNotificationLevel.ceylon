shared abstract class NotificationLevel of allMessages | onlyMentions {

    shared static object allMessages extends NotificationLevel(0) {
        string => "allMessages";
    }

    shared static object onlyMentions extends NotificationLevel(1) {
        string => "onlyMentions";
    }

    shared static NotificationLevel|ParseException parse(String string) =>
            parseNotificationLevel(string) else ParseException("illegal format for NotificationLevel");

    shared Integer id;

    shared new (Integer id) {
        this.id = id;
    }

    hash => id.hash;
}

see (`function NotificationLevel.parse`)
shared NotificationLevel? parseNotificationLevel(String string) =>
        switch (string)
        case ("allMessages") NotificationLevel.allMessages
        case ("onlyMentions") NotificationLevel.onlyMentions
        else null;