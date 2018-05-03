import ceylon.interop.java {
    CeylonMap
}
import ceylon.json {
    JsonObject,
    JsonArray,
    parse
}

import okhttp3 {
    Delegate=Response
}

import pw.dotdash.ceycord.http.service {
    Response
}

shared class OkHttpResponse(delegate) satisfies Response {

    Delegate delegate;

    code => delegate.code();

    message => delegate.message();

    body => delegate.body()?.string_method();

    shared actual JsonObject|JsonArray|Null json {
        if (exists body = this.body) {
            assert (is JsonObject|JsonArray parsed = parse(body));
            return parsed;
        }
        return null;
    }

    headers => CeylonMap(delegate.headers().toMultimap()).collect((key->items) => key.string->[for (item in items) item.string]);
}