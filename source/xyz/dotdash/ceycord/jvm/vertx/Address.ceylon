import ceylon.promise {
    Promise,
    Deferred
}

import io.vertx.ceylon.core.eventbus {
    EventBus,
    Message
}

import xyz.dotdash.ceycord.jvm.request {
    Route
}

shared class Address<Type,Parameters>(eventBus, String address, Route<Parameters> route)
        given Type satisfies Object
        given Parameters satisfies Anything[] {

    shared EventBus eventBus;

    value sender = eventBus.sender<Parameters>(address);

    Promise<Type> get(Parameters parameters) {
        value deferred = Deferred<Type>();

        sender.send(parameters, (Throwable|Message<Type?> result) {
            if (is Throwable result) {
                deferred.reject(result);
            } else if (exists body = result.body()) {
                deferred.fulfill(body);
            } else {
                deferred.reject(Exception("Nothing was returned."));
            }
        });

        return deferred.promise;
    }

    shared Promise<Type>(*Parameters) send = flatten(get);
}