import ceylon.json {
    JsonObject,
    parseJson=parse
}
import ceylon.language.meta {
    type
}
import ceylon.language.meta.declaration {
    Module
}
import ceylon.logging {
    Logger,
    createLogger=logger
}
import ceylon.uri {
    Uri
}

import pw.dotdash.ceycord.impl {
    services
}
import pw.dotdash.ceycord.api.websocket {
    WebSocketService,
    WebSocket
}

shared class Shard(Module user, Uri uri, String token) {

    WebSocketService webSocketService = services.webSocket(user);

    //////////////////////////////////////////////////
    // Locals                                       //
    //////////////////////////////////////////////////

    Logger logger = createLogger(`package`);

    variable Boolean reconnecting = false;
    variable Integer? lastSeq = null;
    variable String? sessionId = null;

    variable late WebSocket webSocket;
    variable late Heartbeater heartbeater;

    //////////////////////////////////////////////////
    // Pre-made JsonObjects                         //
    //////////////////////////////////////////////////

    JsonObject identify => JsonObject {
        "op"->2,
        "d"->JsonObject {
            "properties"->JsonObject {
                "$os"->operatingSystem.name,
                "$browser"->"Ceycord",
                "$device"->"Ceycord"
            },
            "token"->this.token,
            "compress"->false,
            "large_threshold"->250
        }
    };

    JsonObject resume => JsonObject {
        "op"->6,
        "d"->JsonObject {
            "token"->this.token,
            "session_id"->this.sessionId,
            if (exists seq = lastSeq) "seq"->seq
        }
    };

    //////////////////////////////////////////////////
    // Lifecycle                                    //
    //////////////////////////////////////////////////

    shared void start() {
        logger.info("Using ``type(webSocketService)`` for WebSockets.");

        webSocket = webSocketService.newWebSocket {
            uri = uri;
            onOpen = onOpen;
            onMessage = onMessage;
            onClose = onClose;
            onError = noop;
        };
    }

    shared void reconnect() {
        logger.info("Reconnecting to Gateway...");

        webSocket.close(1000, "Reconnecting.");
    }

    //////////////////////////////////////////////////
    // WebSocket Handlers                           //
    //////////////////////////////////////////////////

    void onOpen(WebSocket ws) {
        logger.info("Connected to WebSocket (url: ``uri``)");
    }

    void onMessage(WebSocket ws, String text) {
        "Received WebSocket message that is not JSON."
        assert (is JsonObject json = parseJson(text));

        value op = json.getInteger("op");

        if (exists s = json.getIntegerOrNull("s")) {
            this.lastSeq = s;
        }

        switch (op)
        case (0) { // DISPATCH
            value t = json.getString("t");
            logger.debug("Received Dispatch packet (OP: 0, type: ``t``). Processing...");
        }
        case (1) { // HEARTBEAT
            logger.debug("Received Heartbeat packet (OP: 1). Responding...");

            this.heartbeater.setReceived(true);
            this.heartbeater.sendOne();
        }
        case (7) { // RECONNECT
            logger.debug("Received Reconnect packet (OP: 7). Reconnecting...");

            this.reconnecting = true;
            this.reconnect();

        }
        case (9) { // INVALID SESSION
            logger.debug("Received Invalid Session packet (OP: 9). Invalidating session...");

            this.reconnecting = json.getBoolean("d");
            this.reconnect();
        }
        case (10) { // HELLO
            logger.debug("Received Hello packet (OP: 10). Identifying...");

            value d = json.getObject("d");

            if (this.reconnecting) {
                this.reconnecting = false;
                webSocket.send(resume.string);
                return;
            }

            webSocket.send(identify.string);

            logger.debug("Initializing Heartbeater...");
            this.heartbeater = Heartbeater(user, logger, webSocket, d.getInteger("heartbeat_interval"));
        }
        case (11) { // HEARTBEAT ACK
            logger.debug("Received Heartbeat Ack packet (OP: 11).");
            this.heartbeater.setReceived(true);
            logger.debug("Average Delay: ``this.heartbeater.avgPing``ms");
        }
        else {
            logger.warn("Received unknown packet type. Content: ``json``");
        }
    }

    void onClose(WebSocket ws, Integer code, String? reason) {
        logger.info("Gateway closed (code: ``code``)");
        if (exists reason) {
            logger.info("Reason: " + reason);
        }

        this.heartbeater.shutdown();
    }
}