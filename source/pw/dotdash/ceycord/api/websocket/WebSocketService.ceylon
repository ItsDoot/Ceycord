import ceylon.uri {
    Uri
}

shared interface WebSocketService {

    shared formal WebSocket newWebSocket(
            "The URI to connect to."
            Uri uri,
            "The handler to call when the connection is established."
            void onOpen(WebSocket ws),
            "The handler to call when a message is recieved."
            void onMessage(WebSocket ws, String text),
            "The handler to call when the connection is closed."
            void onClose(WebSocket ws, Integer code, String? reason),
            "The handler to call when the connection is closed without errors."
            void onError(WebSocket ws, Throwable t)) ;
}