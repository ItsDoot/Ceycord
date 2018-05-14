import okhttp3 {
    WebSocketListener,
    OkHttpWebSocket=WebSocket,
    Response
}

import pw.dotdash.ceycord.api.websocket {
    WebSocket
}

shared class OkHttpListener(handleOpen, handleMessage, handleClose, handleError) extends WebSocketListener() {

    void handleOpen(WebSocket ws) ;
    void handleMessage(WebSocket ws, String text) ;
    void handleClose(WebSocket ws, Integer code, String? reason) ;
    void handleError(WebSocket ws, Throwable t) ;

    shared actual void onOpen(OkHttpWebSocket webSocket, Response response) =>
            handleOpen(OkHttpDelegate(webSocket));

    shared actual void onMessage(OkHttpWebSocket webSocket, String text) =>
            handleMessage(OkHttpDelegate(webSocket), text);

    shared actual void onClosed(OkHttpWebSocket webSocket, Integer code, String? reason) =>
            handleClose(OkHttpDelegate(webSocket), code, reason);

    shared actual void onFailure(OkHttpWebSocket webSocket, Throwable t, Response? response) =>
            handleError(OkHttpDelegate(webSocket), t);
}