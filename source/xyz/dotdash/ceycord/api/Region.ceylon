shared class Region {

    shared String key;
    shared String name;
    shared Boolean vip;

    abstract new region(String key, String name) {
        this.key = key;
        this.name = name;
        this.vip = false;
    }

    abstract new vipRegion(String key, String name) {
        this.key = "vip-" + key;
        this.name = name + " (VIP)";
        this.vip = true;
    }

    shared new amsterdam extends region("amsterdam", "Amsterdam") {}
    shared new brazil extends region("brazil", "Brazil") {}
    shared new euWest extends region("eu-west", "EU West") {}
    shared new euCentral extends region("eu-central", "EU Central") {}
    shared new frankfurt extends region("frankfurt", "Frankfurt") {}
    shared new hongKong extends region("hongkong", "Hong Kong") {}
    shared new london extends region("london", "London") {}
    shared new russia extends region("russia", "Russia") {}
    shared new singapore extends region("singapore", "Singapore") {}
    shared new sydney extends region("sydney", "Sydney") {}
    shared new usEast extends region("us-east", "US East") {}
    shared new usWest extends region("us-west", "US West") {}
    shared new usCentral extends region("us-central", "US Central") {}
    shared new usSouth extends region("us-south", "US South") {}

    shared new vipAmsterdam extends vipRegion("amsterdam", "Amsterdam") {}
    shared new vipBrazil extends vipRegion("brazil", "Brazil") {}
    shared new vipEuWest extends vipRegion("eu-west", "EU West") {}
    shared new vipEuCentral extends vipRegion("eu-central", "EU Central") {}
    shared new vipFrankfurt extends vipRegion("frankfurt", "Frankfurt") {}
    shared new vipHongKong extends vipRegion("hongkong", "Hong Kong") {}
    shared new vipLondon extends vipRegion("london", "London") {}
    shared new vipRussia extends vipRegion("russia", "Russia") {}
    shared new vipSingapore extends vipRegion("singapore", "Singapore") {}
    shared new vipSydney extends vipRegion("sydney", "Sydney") {}
    shared new vipUsEast extends vipRegion("us-east", "US East") {}
    shared new vipUsWest extends vipRegion("us-west", "US West") {}
    shared new vipUsCentral extends vipRegion("us-central", "US Central") {}
    shared new vipUsSouth extends vipRegion("us-south", "US South") {}
}