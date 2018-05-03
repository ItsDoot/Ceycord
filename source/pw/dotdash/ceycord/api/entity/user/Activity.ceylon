import ceylon.regex {
    regex
}

shared class Activity {

    static Boolean checkUrl(String url) => regex("""https?://(www\.)?twitch\.tv/.+""").test(url);

    shared ActivityType type;

    shared String name;

    shared String? url;

    shared new playing(String name) {
        this.type = ActivityType.playing;
        this.name = name;
        this.url = null;
    }

    shared new streaming(String name, String url) {
        this.type = ActivityType.streaming;
        this.name = name;
        this.url = url;
    }

    shared new listening(String name) {
        this.type = ActivityType.listening;
        this.name = name;
        this.url = null;
    }

    shared new watching(String name) {
        this.type = ActivityType.watching;
        this.name = name;
        this.url = null;
    }
}