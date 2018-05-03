shared interface Mentionable {

    shared formal String mention;

    shared default String? mentionNickname => null;
}