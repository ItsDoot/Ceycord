shared class Region of amsterdam | brazil | euCentral | euWest | frankfurt | hongkong | london | russia | singapore |
        sydney | usCentral | usEast | usSouth | usWest | vipAmsterdam | vipBrazil | vipEuCentral | vipEuWest |
        vipFrankfurt | vipHongkong | vipLondon | vipRussia | vipSingapore | vipSydney | vipUsCentral | vipUsEast |
        vipUsSouth | vipUsWest {

    shared static Region|ParseException parse(String key) =>
            parseRegion(key) else ParseException("illegal format for Region");

    "The unique name of the Region."
    shared String key;

    "The formatted name of the Region."
    shared String name;

    "Whether the Region is for VIP guilds."
    shared Boolean vip;

    abstract new region(String key, String name, Boolean vip) {
        this.key = key;
        this.name = name;
        this.vip = vip;
    }

    shared new amsterdam extends region("amsterdam", "Amsterdam", false) {}
    shared new brazil extends region("brazil", "Brazil", false) {}
    shared new euCentral extends region("eu-central", "EU Central", false) {}
    shared new euWest extends region("eu-west", "EU West", false) {}
    shared new frankfurt extends region("frankfurt", "Frankfurt", false) {}
    shared new hongkong extends region("hongkong", "Hong Kong", false) {}
    shared new london extends region("london", "London", false) {}
    shared new russia extends region("russia", "Russia", false) {}
    shared new singapore extends region("singapore", "Singapore", false) {}
    shared new sydney extends region("sydney", "Sydney", false) {}
    shared new usCentral extends region("us-central", "US Central", false) {}
    shared new usEast extends region("us-east", "US East", false) {}
    shared new usSouth extends region("us-south", "US South", false) {}
    shared new usWest extends region("us-west", "US West", false) {}

    shared new vipAmsterdam extends region("vip-amsterdam", "Amsterdam (VIP)", true) {}
    shared new vipBrazil extends region("vip-brazil", "Brazil (VIP)", true) {}
    shared new vipEuCentral extends region("vip-eu-central", "EU Central (VIP)", true) {}
    shared new vipEuWest extends region("vip-eu-west", "EU West (VIP)", true) {}
    shared new vipFrankfurt extends region("vip-frankfurt", "Frankfurt (VIP)", true) {}
    shared new vipHongkong extends region("vip-hongkong", "Hong Kong (VIP)", true) {}
    shared new vipLondon extends region("vip-london", "London (VIP)", true) {}
    shared new vipRussia extends region("vip-russia", "Russia (VIP)", true) {}
    shared new vipSingapore extends region("vip-singapore", "Singapore (VIP)", true) {}
    shared new vipSydney extends region("vip-sydney", "Sydney (VIP)", true) {}
    shared new vipUsCentral extends region("vip-us-central", "US Central (VIP)", true) {}
    shared new vipUsEast extends region("vip-us-east", "US East (VIP)", true) {}
    shared new vipUsSouth extends region("vip-us-south", "US South (VIP)", true) {}
    shared new vipUsWest extends region("vip-us-west", "US West (VIP)", true) {}
}

shared Region? parseRegion(String key) =>
        switch (key)
        case ("amsterdam") Region.amsterdam
        case ("brazil") Region.brazil
        case ("euCentral") Region.euCentral
        case ("euWest") Region.euWest
        case ("frankfurt") Region.frankfurt
        case ("hongkong") Region.hongkong
        case ("london") Region.london
        case ("russia") Region.russia
        case ("singapore") Region.singapore
        case ("sydney") Region.sydney
        case ("usCentral") Region.usCentral
        case ("usEast") Region.usEast
        case ("usSouth") Region.usSouth
        case ("usWest") Region.usWest
        case ("vip-amsterdam") Region.vipAmsterdam
        case ("vip-brazil") Region.vipBrazil
        case ("vip-eu-central") Region.vipEuCentral
        case ("vip-eu-west") Region.vipEuWest
        case ("vip-frankfurt") Region.vipFrankfurt
        case ("vip-hongkong") Region.vipHongkong
        case ("vip-london") Region.vipLondon
        case ("vip-russia") Region.vipRussia
        case ("vip-singapore") Region.vipSingapore
        case ("vip-sydney") Region.vipSydney
        case ("vip-us-central") Region.vipUsCentral
        case ("vip-us-east") Region.vipUsEast
        case ("vip-us-south") Region.vipUsSouth
        case ("vip-us-west") Region.vipUsWest
        else null;