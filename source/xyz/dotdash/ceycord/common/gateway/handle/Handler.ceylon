import ceylon.json {
    JsonObject
}

shared native abstract class Handler() {

    shared formal void handle(JsonObject obj) ;

    shared native void reply(JsonObject obj) ;
}