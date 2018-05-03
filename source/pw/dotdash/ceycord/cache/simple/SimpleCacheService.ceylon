import ceylon.collection {
    MutableMap,
    HashMap
}

import pw.dotdash.ceycord.api.entity.guild {
    Guildlike
}
import pw.dotdash.ceycord.api.entity.message {
    Message
}
import pw.dotdash.ceycord.api.entity.permission {
    Role
}
import pw.dotdash.ceycord.api.entity.user {
    User
}
import pw.dotdash.ceycord.cache.service {
    MutableCacheService
}

service (`interface MutableCacheService`)
shared class SimpleCacheService() satisfies MutableCacheService {

    shared actual MutableMap<String,Guildlike> guildMap = HashMap<String,Guildlike>();

    shared actual MutableMap<String,Message> messageMap = HashMap<String,Message>();

    shared actual MutableMap<String,Role> roleMap = HashMap<String,Role>();

    shared actual MutableMap<String,User> userMap = HashMap<String,User>();
}