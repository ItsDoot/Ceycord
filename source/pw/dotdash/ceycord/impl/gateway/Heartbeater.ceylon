import ceylon.json {
    JsonObject
}
import ceylon.logging {
    Logger
}
import ceylon.time.base {
    milliseconds
}

import pw.dotdash.ceycord.api.executor {
    ExecutorService
}
import pw.dotdash.ceycord.api.websocket {
    WebSocket
}
import ceylon.language.meta.declaration {
    Module
}
import pw.dotdash.ceycord.impl {
    services
}
import ceylon.language.meta {
    type
}

shared class Heartbeater(Module user, logger, webSocket, interval) {

    ExecutorService executorService = services.executor(user);

    Logger logger;
    WebSocket webSocket;
    Integer interval;

    shared variable Boolean received = true;
    shared variable Integer? lastSeq = null;

    shared variable Integer avgPing = 0; // milliseconds
    variable Integer lastTime = 0; // milliseconds

    shared JsonObject heartbeat => JsonObject {
        "op"->1,
        "d"->lastSeq
    };

    logger.info("Using ``type(executorService)`` for asynchronous execution.");

    value executorPool = executorService.newExecutorPool(1);

    executorPool.submitPeriodic(() {
        logger.debug("Sending heartbeat.");
        webSocket.send(heartbeat.string);
        this.received = false;
        this.lastTime = system.milliseconds;
    }, 0, interval, milliseconds);

    shared void sendOne() {
        logger.debug("Sending one heartbeat.");
        webSocket.send(heartbeat.string);
        this.received = false;
    }

    shared void shutdown() {
        executorPool.shutdown();
    }

    shared void setReceived(Boolean received) {
        this.received = received;
        if (received) {
            this.avgPing = (avgPing + system.milliseconds - lastTime) / 2;
        }
    }
}