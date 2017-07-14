import xyz.dotdash.ceycord.api {
    Client
}

shared abstract class CeylonClient satisfies Client {

    shared actual String token;

    shared new (String token) {
        this.token = token;
    }


}