shared interface WebSocket {

    shared formal void close(Integer code, String? reason);

    shared formal void send(String text);
}