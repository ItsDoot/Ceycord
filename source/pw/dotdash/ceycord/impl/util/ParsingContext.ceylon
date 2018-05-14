import ceylon.collection {
    HashMap
}

import pw.dotdash.ceycord.api {
    Ceycord
}

shared class ParsingContext() satisfies Category<String> {

    value map = HashMap<String,Object>();

    shared T? get<T>(String key) {
        assert (is T? item = map.get(key));
        return item;
    }

    shared T require<T>(String key) {
        assert (is T item = map.get(key));
        return item;
    }

    shared void put(String key, Object item) {
        this.map[key] = item;
    }

    shared Ceycord ceycord => require<Ceycord>("ceycord");

    shared actual Boolean contains(String element) => map.contains(element);
}