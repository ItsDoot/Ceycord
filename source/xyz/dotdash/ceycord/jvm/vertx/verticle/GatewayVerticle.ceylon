import ceylon.promise {
    Promise,
    Deferred
}

import io.vertx.ceylon.core {
    Verticle,
    Future
}
import io.vertx.ceylon.core.buffer {
    Buffer,
    buffer
}
import io.vertx.ceylon.core.http {
    HttpClientResponse,
    HttpClient,
    WebSocket
}

import xyz.dotdash.ceycord.jvm.request {
    routes
}

shared String gatewayVersion = "5";

shared class GatewayVerticle() extends Verticle() {

    shared actual void startAsync(Future<Anything> startFuture) {
        value http = vertx.createHttpClient();

        retrieveGatewayUrl(http).flatMap(([String, Integer] ret) { // GET /gateway/bot
            value [url, shards] = ret;

            return connectToGateway(http, url, shards);
        }).completed((WebSocket ws) {
            ws.binaryMessageHandler(handlePayloads);

            startFuture.complete();
        }, (Throwable t) {
            startFuture.fail(t);
        });
    }

    Promise<[String, Integer]> retrieveGatewayUrl(HttpClient http) {
        value deferred = Deferred<[String, Integer]>();

        http.get(routes.gateway.bot.get.apply(), (HttpClientResponse response) {
            response.bodyHandler((Buffer buffer) {
                value json = buffer.toJsonObject();

                value url = json.getString("url");
                value shards = json.getInteger("shards");

                deferred.complete([url, shards]);
            }).exceptionHandler((Throwable t) {
                deferred.reject(t);
            });
        });

        return deferred.promise;
    }

    Promise<WebSocket> connectToGateway(HttpClient http, String url, Integer shards) {
        value deferred = Deferred<WebSocket>();

        http.websocket(url + "?v=``gatewayVersion``&encoding=json", (WebSocket ws) {
            deferred.fulfill(ws);
        }, (Throwable t) {
            deferred.reject(t);
        });

        return deferred.promise;
    }

    void handlePayloads(Buffer buffer) {
        value json = buffer.toJsonObject();

        value opCode = json.getInteger("op");
    }
}