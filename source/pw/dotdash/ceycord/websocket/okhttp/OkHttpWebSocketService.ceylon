import ceylon.uri {
    Uri
}

import okhttp3 {
    OkHttpClient,
    Request
}

import pw.dotdash.ceycord.api.websocket {
    WebSocketService,
    WebSocket
}

service (`interface WebSocketService`)
shared class OkHttpWebSocketService() satisfies WebSocketService {

    value client = OkHttpClient.Builder().build();

    shared actual WebSocket newWebSocket(
            Uri uri,
            void onOpen(WebSocket ws),
            void onMessage(WebSocket ws, String text),
            void onClose(WebSocket ws, Integer code, String? reason),
            void onError(WebSocket ws, Throwable t)) {
        value request = Request.Builder().url(uri.string).build();
        return OkHttpDelegate(client.newWebSocket(request, OkHttpListener(onOpen, onMessage, onClose, onError)));
    }
}