import xyz.dotdash.ceycord.common.entity {
    CeylonGame
}

shared interface Game {

    shared formal String name;

    shared formal String? url;
}

shared Game game(String name, String? url = null) {
    return CeylonGame(name, url);
}