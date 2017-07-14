import ceylon.promise {
    Promise
}

import xyz.dotdash.ceycord.api.entity {
    User,
    ClientLinked
}

shared interface DirectChannel of DirectTextChannel | DirectVoiceChannel satisfies Channel & ClientLinked {

    shared formal User user;
}

shared interface DirectTextChannel satisfies DirectChannel & TextChannel {

    shared formal Promise<Nothing> close() ;
}

shared interface DirectVoiceChannel satisfies DirectChannel & VoiceChannel {
}