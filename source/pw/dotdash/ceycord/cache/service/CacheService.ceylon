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

shared interface CacheService {

    shared formal Map<String,Guildlike> guildMap;

    shared default {Guildlike*} guilds => guildMap.items;

    shared default Guildlike? getGuildById(String id) => guildMap[id];

    shared formal Map<String,Message> messageMap;

    shared default {Message*} messages => messageMap.items;

    shared default Message? getMessageById(String id) => messageMap[id];

    shared formal Map<String,Role> roleMap;

    shared default {Role*} roles => roleMap.items;

    shared default Role? getRoleById(String id) => roleMap[id];

    shared formal Map<String,User> userMap;

    shared default {User*} users => userMap.items;

    shared default User? getUserById(String id) => userMap[id];
}