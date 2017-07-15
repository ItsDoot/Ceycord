shared class OnlineStatus of online | idle | doNotDisturb | invisible | offline {

    shared static OnlineStatus? with(String id) {
        return `OnlineStatus`.caseValues.find((status) => status.id.equalsIgnoringCase(id));
    }

    shared String id;

    shared new online {
        this.id = "online";
    }

    shared new idle {
        this.id = "idle";
    }

    shared new doNotDisturb {
        this.id = "dnd";
    }

    shared new invisible {
        this.id = "invisible";
    }

    shared new offline {
        this.id = "offline";
    }
}