"A WebSocket service implementation via the `okhttp` java library."
native ("jvm")
module pw.dotdash.ceycord.websocket.okhttp "1.0.0" {

    shared import pw.dotdash.ceycord.api "1.0.0";

    shared import java.base "8";
    shared import maven:"com.squareup.okhttp3:okhttp" "3.10.0";
}