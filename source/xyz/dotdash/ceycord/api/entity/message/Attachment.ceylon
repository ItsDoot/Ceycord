import xyz.dotdash.ceycord.api.entity {
    Distinct
}

shared interface Attachment satisfies Distinct {

    shared formal String filename;

    shared formal Integer size;

    shared formal String url;

    shared formal String proxyUrl;

    shared interface Image satisfies Attachment {

        shared formal Integer width;

        shared formal Integer height;
    }
}