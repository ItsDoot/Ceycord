shared abstract class ActivityType of playing | streaming | listening | watching {

    shared static object playing extends ActivityType(0) {
        string = "playing";
    }

    shared static object streaming extends ActivityType(1) {
        string = "streaming";
    }

    shared static object listening extends ActivityType(2) {
        string = "listening";
    }

    shared static object watching extends ActivityType(3) {
        string = "watching";
    }

    shared static ActivityType|ParseException parse(String|Integer stringOrId) =>
            parseActivityType(stringOrId) else ParseException("illegal format for ActivityType");

    shared Integer id;

    shared new (Integer id) {
        this.id = id;
    }

    hash = id.hash;
}

shared ActivityType? parseActivityType(String|Integer stringOrId) =>
        switch (stringOrId)
        case ("playing"|0) ActivityType.playing
        case ("streaming"|1) ActivityType.streaming
        case ("listening"|2) ActivityType.listening
        case ("watching"|3) ActivityType.watching
        else null;