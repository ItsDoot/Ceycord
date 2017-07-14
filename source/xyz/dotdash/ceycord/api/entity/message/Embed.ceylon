import ceylon.time.timezone {
    ZoneDateTime
}

shared interface Embed {

    shared formal String url;

    shared formal String? title;

    shared formal String? description;

    shared formal Thumbnail? thumbnail;

    shared formal Provider? provider;

    shared formal Video? video;

    shared formal Image? image;

    shared formal Author? author;

    shared formal Footer? footer;

    shared formal {Field*} fields;

    shared formal Integer? color;

    shared formal ZoneDateTime? timestamp;

    shared formal Integer length;

    shared interface Thumbnail {

        shared formal String url;

        shared formal String proxyUrl;

        shared formal Integer width;

        shared formal Integer height;
    }

    shared interface Provider {

        shared formal String name;

        shared formal String? url;
    }

    shared interface Video {

        shared formal String url;

        shared formal Integer width;

        shared formal Integer height;
    }

    shared interface Image {

        shared formal String url;

        shared formal String proxyUrl;

        shared formal Integer width;

        shared formal Integer height;
    }

    shared interface Author {

        shared formal String? name;

        shared formal String? url;

        shared formal String? iconUrl;

        shared formal String? proxyIconUrl;
    }

    shared interface Footer {

        shared formal String? text;

        shared formal String? iconUrl;

        shared formal String? proxyIconUrl;
    }

    shared interface Field {

        shared formal String? name;

        shared formal String? val;

        shared formal Boolean inline;
    }
}