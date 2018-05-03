import ceylon.logging {
    Priority,
    Category,
    info
}
import ceylon.time {
    now
}
import ceylon.locale {
    systemLocale
}

shared void writeFormattedLog(Priority p, Category c, String msg, Throwable? t) {
    value print = p<=info then process.write else process.writeError;

    value instant = now();
    value formats = systemLocale.formats;

    value date = formats.shortFormatDate(instant.date());
    value time = formats.mediumFormatTime(instant.time());

    print("[``date`` ``time``] ``p``: ``msg``");
    print(operatingSystem.newline);

    if (exists t) {
        printStackTrace(t, print);
    }
}
