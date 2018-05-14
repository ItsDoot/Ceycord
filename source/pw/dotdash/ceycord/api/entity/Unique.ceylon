import pw.dotdash.ceycord.api {
    Ceycord
}

shared interface Unique {

    shared formal Ceycord ceycord;

    shared formal String id;

    shared default Integer idInteger {
        assert (is Integer i = Integer.parse(id));
        return i;
    }
}