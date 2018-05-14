import ceylon.json {
    JsonObject
}
import ceylon.promise {
    Promise
}

import pw.dotdash.ceycord.api.http {
    methodDelete=delete,
    methodGet=get,
    methodPatch=patch,
    methodPost=post,
    methodPut=put
}

shared interface HttpService {

    shared formal class HttpClient(String baseUrl) {

        shared formal Promise<Response> request(Method method, String route, JsonObject? body, <String->String>*headers) ;

        shared default Promise<Response> delete(String route, JsonObject? body, <String->String>*headers) =>
                request(methodDelete, route, body, *headers);

        shared default Promise<Response> get(String route, <String->String>*headers) =>
                request(methodGet, route, null, *headers);

        shared default Promise<Response> patch(String route, JsonObject? body, <String->String>*headers) =>
                request(methodPatch, route, body, *headers);

        shared default Promise<Response> post(String route, JsonObject? body, <String->String>*headers) =>
                request(methodPost, route, body, *headers);

        shared default Promise<Response> put(String route, JsonObject? body, <String->String>*headers) =>
                request(methodPut, route, body, *headers);
    }
}