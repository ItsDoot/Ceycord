"An HTTP Client service implementation via the `okhttp` java library."
native ("jvm")
module pw.dotdash.ceycord.http.okhttp "1.0.0" {

    shared import pw.dotdash.ceycord.http.service "1.0.0";

    shared import java.base "8";
    shared import ceylon.interop.java "1.3.3";
    shared import maven:"com.squareup.okhttp3:okhttp" "3.10.0";
}