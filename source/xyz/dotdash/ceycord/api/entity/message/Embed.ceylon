import ceylon.time.timezone {
    ZoneDateTime
}

import xyz.dotdash.ceycord.common.entity.message {
    CeylonEmbed,
    CeylonEmbedThumbnail,
    CeylonEmbedProvider,
    CeylonEmbedVideo,
    CeylonEmbedImage,
    CeylonEmbedAuthor,
    CeylonEmbedFooter,
    CeylonEmbedField
}

shared interface Embed {

    shared formal String url;

    shared formal String? title;

    shared formal String? description;

    shared formal EmbedThumbnail? thumbnail;

    shared formal EmbedProvider? provider;

    shared formal EmbedVideo? video;

    shared formal EmbedImage? image;

    shared formal EmbedAuthor? author;

    shared formal EmbedFooter? footer;

    shared formal {EmbedField*} fields;

    shared formal Integer? color;

    shared formal ZoneDateTime? timestamp;

    shared formal Integer length;
}

shared interface EmbedThumbnail {

    shared formal String url;

    shared formal String proxyUrl;

    shared formal Integer width;

    shared formal Integer height;
}

shared interface EmbedProvider {

    shared formal String name;

    shared formal String? url;
}

shared interface EmbedVideo {

    shared formal String url;

    shared formal Integer width;

    shared formal Integer height;
}

shared interface EmbedImage {

    shared formal String url;

    shared formal String proxyUrl;

    shared formal Integer width;

    shared formal Integer height;
}

shared interface EmbedAuthor {

    shared formal String? name;

    shared formal String? url;

    shared formal String? iconUrl;

    shared formal String? proxyIconUrl;
}

shared interface EmbedFooter {

    shared formal String? text;

    shared formal String? iconUrl;

    shared formal String? proxyIconUrl;
}

shared interface EmbedField {

    shared formal String? name;

    shared formal String? val;

    shared formal Boolean inline;
}

shared Embed embed(String url, String? title = null, String? description = null, EmbedThumbnail? thumbnail = null,
        EmbedProvider? provider = null, EmbedVideo? video = null, EmbedImage? image = null, EmbedAuthor? author = null,
        EmbedFooter? footer = null, {EmbedField*} fields = {}, Integer? color = null, ZoneDateTime? timestamp = null) {
    return CeylonEmbed(url, title, description, thumbnail, provider, video, image, author, footer, fields, color, timestamp);
}

shared EmbedThumbnail thumbnail(String url, String proxyUrl, Integer width, Integer height) {
    return CeylonEmbedThumbnail(url, proxyUrl, width, height);
}

shared EmbedProvider provider(String name, String? url = null) {
    return CeylonEmbedProvider(name, url);
}

shared EmbedVideo video(String url, Integer width, Integer height) {
    return CeylonEmbedVideo(url, width, height);
}

shared EmbedImage image(String url, String proxyUrl, Integer width, Integer height) {
    return CeylonEmbedImage(url, proxyUrl, width, height);
}

shared EmbedAuthor author(String? name = null, String? url = null, String? iconUrl = null, String? proxyIconUrl = null) {
    return CeylonEmbedAuthor(name, url, iconUrl, proxyIconUrl);
}

shared EmbedFooter footer(String? text = null, String? iconUrl = null, String? proxyIconUrl = null) {
    return CeylonEmbedFooter(text, iconUrl, proxyIconUrl);
}

shared EmbedField field(Boolean inline, String? name = null, String? val = null) {
    return CeylonEmbedField(inline, name, val);
}