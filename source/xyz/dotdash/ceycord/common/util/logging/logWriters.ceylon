import ceylon.locale {
    systemLocale
}
import ceylon.logging {
    Priority,
    Category,
    info
}
import ceylon.time {
    now
}
import ceylon.language.meta {
    annotations
}

shared object logWriters {

    shared void consoleLog(Priority p, Category c, String m, Throwable? t) {
        value print = p<=info then process.write else process.writeError;

        value instant = now();
        value formats = systemLocale.formats;

        value date = formats.shortFormatDate(instant.date());
        value time = formats.mediumFormatTime(instant.time());

        String name;
        if (exists namedLogger = annotations(`NamedLoggerAnnotation`, c)) {
            name = namedLogger.name;
        } else {
            name = c.qualifiedName;
        }

        print("[``date`` at ``time``] [``name``] ``p.string``: ``m``");
        print(operatingSystem.newline);

        if (exists t) {
            printStackTrace(t, print);
        }
    }
}