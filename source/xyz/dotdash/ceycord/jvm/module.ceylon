import xyz.dotdash.ceycord.common.util.logging {
    namedLogger
}

"A JVM Implementation of Ceycord, a Ceylon API Wrapper for Discord."
native ("jvm")
license ("MIT License")
namedLogger ("Ceycord/JVM")
module xyz.dotdash.ceycord.jvm "0.0.1" {

    shared import xyz.dotdash.ceycord.api "0.0.1";
    shared import xyz.dotdash.ceycord.common "0.0.1";

    shared import io.vertx.ceylon.core "3.4.2";
}