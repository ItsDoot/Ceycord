import ceylon.language.meta.declaration {
    Module
}

import pw.dotdash.ceycord.api.cache {
    CacheService
}
import pw.dotdash.ceycord.api.executor {
    ExecutorService
}
import pw.dotdash.ceycord.api.http {
    HttpService
}
import pw.dotdash.ceycord.api.websocket {
    WebSocketService
}

shared object services {

    shared CacheService cache(Module user) {
        "Could not find a CacheService implementation! You must import one in your module.ceylon!"
        assert (exists service = user.findServiceProviders(`CacheService`).first);
        return service;
    }

    shared ExecutorService executor(Module user) {
        "Could not find an ExecutorService implementation! You must import one in your module.ceylon!"
        assert (exists service = user.findServiceProviders(`ExecutorService`).first);
        return service;
    }

    shared HttpService http(Module user) {
        "Could not find an HttpService implementation! You must import one in your module.ceylon!"
        assert (exists service = user.findServiceProviders(`HttpService`).first);
        return service;
    }

    shared WebSocketService webSocket(Module user) {
        "Could not find a WebSocketService implementation! You must import one in your module.ceylon!"
        assert (exists service = user.findServiceProviders(`WebSocketService`).first);
        return service;
    }
}