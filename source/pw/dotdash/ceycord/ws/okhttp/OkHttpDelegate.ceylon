import pw.dotdash.ceycord.ws.service {
    WebSocket
}
import okhttp3 {
    OkHttpWebSocket=WebSocket
}

shared class OkHttpDelegate(delegate) satisfies WebSocket {

    OkHttpWebSocket delegate;

    close(Integer code, String? reason) => delegate.close(code, reason);

    send(String text) => delegate.send(text);
}