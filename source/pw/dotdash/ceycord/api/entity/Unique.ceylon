shared interface Unique {

    shared formal String id;

    shared default Integer idInteger {
        assert (is Integer i = Integer.parse(id));
        return i;
    }
}