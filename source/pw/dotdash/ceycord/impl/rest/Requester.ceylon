import ceylon.json {
    JsonObject
}
import ceylon.language.meta {
    type
}
import ceylon.language.meta.declaration {
    Module
}
import ceylon.logging {
    createLogger=logger,
    Logger
}
import ceylon.promise {
    Promise
}

import pw.dotdash.ceycord.http.service {
    HttpService
}
import pw.dotdash.ceycord.impl {
    services
}
import pw.dotdash.ceycord.impl.entity {
    UserImpl
}
import pw.dotdash.ceycord.impl.util {
    jsonRegistry
}

shared class Requester(Module user, String fullToken) {

    Logger logger = createLogger(`package`);

    HttpService httpService = services.http(user);
    value client = httpService.HttpClient("https://discordapp.com/api/v6");
    jsonRegistry.registerStandard();

    shared {<String->String>*} headers = {
        "Authorization"->fullToken,
        "User-Agent"->"DiscordBot (https://github.com/xDotDash/Ceycord, v1.0.0)"
    };

    shared Promise<UserImpl> getUserImpl(String id) =>
            client.get(routes.users.getUser.apply(id), *headers).map((resp) {
                "Response was not a JsonObject (actual: ``type(resp.json)``"
                assert (is JsonObject obj = resp.json);
                logger.trace("Response code: ``resp.code``");
                logger.trace("Received User: " + obj.pretty);

                return jsonRegistry.deserialize<UserImpl>(obj);
            });
}