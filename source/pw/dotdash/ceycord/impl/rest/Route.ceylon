import ceylon.json {
    JsonObject
}
import ceylon.promise {
    Promise
}

import pw.dotdash.ceycord.api.http {
    Method,
    Response,
    HttpService
}

shared class Route<Parameters>(method, apply)
        given Parameters satisfies Anything[] {

    "The HTTP method."
    shared Method method;

    shared String(*Parameters) apply;

    shared Promise<Response>(*Parameters) do(HttpService.HttpClient client, JsonObject? body, <String->String>*headers) =>
            flatten((Parameters params) => client.request(method, apply(*params), body, *headers));
}