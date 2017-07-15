import ceylon.time.timezone {
    ZoneDateTime
}

import xyz.dotdash.ceycord.api.entity.message {
    Embed,
    EmbedThumbnail,
    EmbedProvider,
    EmbedVideo,
    EmbedImage,
    EmbedAuthor,
    EmbedFooter,
    EmbedField
}

shared class CeylonEmbed satisfies Embed {

    shared actual String url;
    shared actual String? title;
    shared actual String? description;
    shared actual EmbedThumbnail? thumbnail;
    shared actual EmbedProvider? provider;
    shared actual EmbedVideo? video;
    shared actual EmbedImage? image;
    shared actual EmbedAuthor? author;
    shared actual EmbedFooter? footer;
    shared actual {EmbedField*} fields;

    shared actual Integer? color;


    shared actual ZoneDateTime? timestamp;

    shared new (String url, String? title = null, String? description = null, EmbedThumbnail? thumbnail = null,
            EmbedProvider? provider = null, EmbedVideo? video = null, EmbedImage? image = null, EmbedAuthor? author = null,
            EmbedFooter? footer = null, {EmbedField*} fields = {}, Integer? color = null, ZoneDateTime? timestamp = null) {
        this.url = url;
        this.title = title;
        this.description = description;
        this.thumbnail = thumbnail;
        this.provider = provider;
        this.video = video;
        this.image = image;
        this.author = author;
        this.footer = footer;
        this.fields = fields;
        this.color = color;
        this.timestamp = timestamp;
    }

    shared actual Integer length => 0;
}

shared class CeylonEmbedThumbnail(url, proxyUrl, width, height) satisfies EmbedThumbnail {

    shared actual String url;
    shared actual String proxyUrl;
    shared actual Integer width;
    shared actual Integer height;
}

shared class CeylonEmbedProvider(name, url = null) satisfies EmbedProvider {

    shared actual String name;
    shared actual String? url;
}

shared class CeylonEmbedVideo(url, width, height) satisfies EmbedVideo {

    shared actual String url;
    shared actual Integer width;
    shared actual Integer height;
}

shared class CeylonEmbedImage(url, proxyUrl, width, height) satisfies EmbedImage {

    shared actual String url;
    shared actual String proxyUrl;
    shared actual Integer width;
    shared actual Integer height;
}

shared class CeylonEmbedAuthor(name = null, url = null, iconUrl = null, proxyIconUrl = null) satisfies EmbedAuthor {

    shared actual String? name;
    shared actual String? url;
    shared actual String? iconUrl;
    shared actual String? proxyIconUrl;
}

shared class CeylonEmbedFooter(text = null, iconUrl = null, proxyIconUrl = null) satisfies EmbedFooter {

    shared actual String? text;
    shared actual String? iconUrl;
    shared actual String? proxyIconUrl;
}

shared class CeylonEmbedField(inline, name = null, val = null) satisfies EmbedField {

    shared actual Boolean inline;
    shared actual String? name;
    shared actual String? val;
}