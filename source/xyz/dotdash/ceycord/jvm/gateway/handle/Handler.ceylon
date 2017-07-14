import ceylon.json {
    JsonObject
}

import io.vertx.ceylon.core.http {
    WebSocket
}

shared interface Handler {

    shared formal void handle(JsonObject obj, WebSocket ws) ;
}