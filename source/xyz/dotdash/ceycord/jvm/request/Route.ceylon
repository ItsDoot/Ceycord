import io.vertx.ceylon.core.http {
    HttpMethod,
    get,
    post,
    patch,
    delete,
    put
}

shared class Route<Parameters=[]>(method, apply) given Parameters satisfies Anything[] {

    shared HttpMethod method;

    shared String(*Parameters) apply;
}

shared Route<Parameters> rGet<Parameters=[]>(String(*Parameters) apply) given Parameters satisfies Anything[] {
    return Route(get, apply);
}

shared Route<Parameters> rPost<Parameters=[]>(String(*Parameters) apply) given Parameters satisfies Anything[] {
    return Route(post, apply);
}

shared Route<Parameters> rPut<Parameters=[]>(String(*Parameters) apply) given Parameters satisfies Anything[] {
    return Route(put, apply);
}

shared Route<Parameters> rPatch<Parameters=[]>(String(*Parameters) apply) given Parameters satisfies Anything[] {
    return Route(patch, apply);
}

shared Route<Parameters> rDelete<Parameters=[]>(String(*Parameters) apply) given Parameters satisfies Anything[] {
    return Route(delete, apply);
}