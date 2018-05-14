import ceylon.collection {
    MapMutator
}

shared object emptyMutableMap satisfies Map<Nothing,Nothing> & MapMutator<Object,Anything> {

    get(Object key) => null;

    shared actual Default getOrDefault<Default>(Object key, Default default) => default;

    keys => emptySet;
    items => emptySet;

    clone() => this;
    iterator() => emptyIterator;
    size => 0;
    empty => true;

    defines(Object key) => false;

    contains(Object entry) => false;
    containsAny({Object*} elements) => false;
    containsEvery({Object*} elements) => false;

    shared actual Map<Nothing,Result> mapItems<Result>(Result mapping(Nothing key, Nothing item))
            given Result satisfies Object
            => emptyMap;

    count(Boolean selecting(Nothing->Nothing element)) => 0;
    any(Boolean selecting(Nothing->Nothing element)) => false;
    every(Boolean selecting(Nothing->Nothing element)) => true;

    find(Boolean selecting(Nothing->Nothing element)) => null;
    findLast(Boolean selecting(Nothing->Nothing element)) => null;

    skip(Integer skipping) => this;
    take(Integer taking) => this;
    by(Integer step) => this;

    shared actual void each(void step(Nothing->Nothing element)) {}

    shared actual void clear() {}

    put(Object key, Anything item) => null;

    remove(Object key) => null;

    hash => 0;

    equals(Object that) => true;

}