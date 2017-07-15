shared interface Manageable<Entity,EntityManager> of Entity
        given Entity satisfies Manageable<Entity,EntityManager>
        given EntityManager satisfies Manager<EntityManager,Entity> {

    shared formal EntityManager manager;
}