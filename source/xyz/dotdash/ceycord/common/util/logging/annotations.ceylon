import ceylon.logging {
    Category
}

shared annotation final class NamedLoggerAnnotation(name) satisfies OptionalAnnotation<NamedLoggerAnnotation,Category> {

    "The name of the logger."
    shared String name;
}

shared annotation NamedLoggerAnnotation namedLogger(String name) => NamedLoggerAnnotation(name);