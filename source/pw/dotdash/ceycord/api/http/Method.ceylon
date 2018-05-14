shared abstract class Method {

    shared static Method|ParseException parse(String string) =>
            parseMethod(string) else ParseException("illegal format for Method");

    shared new () {}

    hash => string.hash;
}

shared object delete extends Method() {
    string = "DELETE";
}

shared object get extends Method() {
    string = "GET";
}

shared object patch extends Method() {
    string = "PATCH";
}

shared object post extends Method() {
    string = "POST";
}

shared object put extends Method() {
    string = "PUT";
}

shared Method? parseMethod(String string) =>
        switch (string)
        case ("DELETE") delete
        case ("GET") get
        case ("PATCH") patch
        case ("POST") post
        case ("PUT") put
        else null;