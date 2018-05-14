shared alias Property<T> => T|Unchanged;

"A type that represents a property that will not be changed."
shared abstract class Unchanged of unchanged {

    shared new () {}
}

shared object unchanged extends Unchanged() {
    string = "unchanged";
    hash = 1;
}