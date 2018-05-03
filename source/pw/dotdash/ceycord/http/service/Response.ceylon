import ceylon.json {
    JsonObject,
    JsonArray
}

shared interface Response {

    "The HTTP status code."
    shared formal Integer code;

    "THE HTTP status message."
    shared formal String message;

    "The HTTP response body."
    shared formal String? body;

    "The HTTP response body parsed as JSON."
    shared formal JsonObject|JsonArray|Null json;

    "The HTTP headers."
    shared formal <String->String[]>[] headers;

    "Whether the request was successful. [[True|true]] for status codes in the [200,300) range."
    shared default Boolean successful => 200<=code<300;
}