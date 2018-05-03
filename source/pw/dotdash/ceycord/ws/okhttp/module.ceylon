"A WebSocket service implementation via the `okhttp` java library."
native ("jvm")
module pw.dotdash.ceycord.ws.okhttp "1.0.0" {

    shared import pw.dotdash.ceycord.ws.service "1.0.0";

    shared import java.base "8";
    shared import maven:"com.squareup.okhttp3:okhttp" "3.10.0";
}