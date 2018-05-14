module pw.dotdash.ceycord.impl "1.0.0" {

    shared import ceylon.json "1.3.3";
    shared import ceylon.time "1.3.3";
    shared import ceylon.locale "1.3.3";
    shared import ceylon.logging "1.3.3";

    shared import pw.dotdash.ceycord.api "1.0.0";

    native ("jvm")
    shared import pw.dotdash.ceycord.executor.java "1.0.0";
}