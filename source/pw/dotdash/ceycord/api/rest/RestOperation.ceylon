import ceylon.promise {
    Promise
}

shared class RestOperation<out Value>() {

    shared Promise<Value> promise {
        return nothing;
    }

    shared void async(Anything(Value) success, Anything(Throwable) failure) {
        promise.completed(success, failure);
    }

    shared Value|Throwable complete() {
        return nothing;
    }
}