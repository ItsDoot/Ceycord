import ceylon.promise {
    Promise
}
import xyz.dotdash.ceycord.api.entity {
    ClientLinked
}

shared interface Manager<EntityManager,Entity> of EntityManager satisfies ClientLinked
        given EntityManager satisfies Manager<EntityManager,Entity>
        given Entity satisfies Manageable<Entity,EntityManager> {

    "The entity that is being managed."
    shared formal Entity target;

    "Attempts to update the entity with the new values."
    shared formal Promise<Entity> update() ;

    "Sets all values to their corresponding values of [[target]]."
    shared formal EntityManager reset() ;
}