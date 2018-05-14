import ceylon.json {
    JsonObject
}
import ceylon.promise {
    Promise,
    Deferred
}

import java.io {
    IOException
}

import okhttp3 {
    OkHttpClient,
    Request,
    Callback,
    Call,
    OkResponse=Response,
    RequestBody,
    MediaType
}

import pw.dotdash.ceycord.api.http {
    HttpService,
    Response,
    Method
}
import pw.dotdash.ceycord.api.http.exception {
    NotFoundException,
    HttpResponseException
}

service (`interface HttpService`)
shared class OkHttpService() satisfies HttpService {

    shared actual class HttpClient(String baseUrl) extends super.HttpClient(baseUrl) {

        value client = OkHttpClient.Builder().build();

        shared actual Promise<Response> request(Method method, String route, JsonObject? body, <String->String>*headers) {
            value request = Request.Builder()
                .method(method.string, if (exists body) then RequestBody.create(MediaType.parse("application/json"), body.string) else null)
                .url(baseUrl + route);
            headers.each((key->item) => request.addHeader(key, item));

            value deferred = Deferred<Response>();
            client.newCall(request.build()).enqueue(DeferredCallback(deferred));
            return deferred.promise;
        }

        class DeferredCallback(Deferred<Response> deferred) satisfies Callback {
            onFailure(Call call, IOException e) => deferred.reject(e);

            shared actual void onResponse(Call call, OkResponse response) {
                if (response.successful) {
                    deferred.fulfill(OkHttpResponse(response));
                    return;
                }

                switch (response.code())
                case (404) {
                    deferred.reject(NotFoundException());
                }
                else {
                    deferred.reject(HttpResponseException(response.code(), response.message()));
                }
            }
        }
    }
}