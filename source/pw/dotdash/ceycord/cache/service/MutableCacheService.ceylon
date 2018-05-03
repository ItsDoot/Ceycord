import ceylon.collection {
    MutableMap
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

shared interface MutableCacheService satisfies CacheService {

    shared formal actual MutableMap<String,Guildlike> guildMap;

    shared formal actual MutableMap<String,Message> messageMap;

    shared formal actual MutableMap<String,Role> roleMap;

    shared formal actual MutableMap<String,User> userMap;
}