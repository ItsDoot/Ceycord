import xyz.dotdash.ceycord.api.entity {
    Game
}

shared class CeylonGame(name, url = null) satisfies Game {

    shared actual String name;

    shared actual String? url;

    shared actual Boolean equals(Object that) {
        if (!is CeylonGame that) {
            return false;
        }

        if (exists url, exists thatUrl = that.url) {
            return name == that.name && url == thatUrl;
        } else {
            return name == that.name;
        }
    }

    hash => (name + (url else "")).hash;

    string => if (exists url) then "Game(``name``|``url``)" else "Game(``name``)";
}