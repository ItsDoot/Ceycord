import ceylon.language.meta.declaration {
    Module
}

import pw.dotdash.ceycord.cache.service {
    MutableCacheService
}
import pw.dotdash.ceycord.executor.service {
    ExecutorService
}
import pw.dotdash.ceycord.http.service {
    HttpService
}
import pw.dotdash.ceycord.ws.service {
    WebSocketService
}

shared object services {

    shared MutableCacheService cache(Module user) {
        "Could not find a CacheService implementation! You must import one in your module.ceylon!"
        assert (exists service = user.findServiceProviders(`MutableCacheService`).first);
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