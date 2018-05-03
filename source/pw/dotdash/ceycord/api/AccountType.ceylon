shared abstract class AccountType of client | bot {

    "The value representing a client account."
    shared static object client extends AccountType("") {
        string => "client";
    }

    "The value representing a bot account."
    shared static object bot extends AccountType("Bot ") {
        string => "bot";
    }

    shared static AccountType|ParseException parse(String string) =>
            parseAccountType(string) else ParseException("illegal format for AccountType");

    shared String prefix;

    shared new (String prefix) {
        this.prefix = prefix;
    }

    hash => string.hash;
}

see (`function AccountType.parse`)
shared AccountType? parseAccountType(String string) =>
        switch (string)
        case ("client") AccountType.client
        case ("bot") AccountType.bot
        else null;