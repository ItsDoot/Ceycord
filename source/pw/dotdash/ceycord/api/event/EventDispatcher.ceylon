shared interface EventDispatcher {

    shared formal {Anything(Event)*} listeners;

    shared formal void register<E>(void handle(E event)) given E satisfies Event;
}