import xyz.dotdash.ceycord.common.util.logging {
    namedLogger
}

"""Common code shared between implementations of Ceycord, a Ceylon API wrapper for Discord.

   Current Implementations:
   * JVM
   """
license ("MIT LICENSE")
namedLogger ("Ceycord")
module xyz.dotdash.ceycord.common "0.0.1" {

    shared import ceylon.json "1.3.2";
    shared import ceylon.logging "1.3.2";
    shared import ceylon.locale "1.3.2";

    shared import xyz.dotdash.ceycord.api "1.0.0";

    native ("jvm") import xyz.dotdash.ceycord.jvm "1.0.0";
}