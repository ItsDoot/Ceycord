import ceylon.time {
    Instant
}

shared class Embed {

    shared String? title;

    shared String? type;

    shared String? description;

    shared String? url;

    shared Instant? timestamp;

    shared Integer? color;

    shared Thumbnail? thumbnail;

    shared Video? video;

    shared Image? image;

    shared Provider? provider;

    shared Author? author;

    shared Footer? footer;

    shared {Field*} fields;

    shared new (String? title, String? type, String? description, String? url, Instant? timestamp, Integer? color,
            Thumbnail? thumbnail, Video? video, Image? image, Provider? provider, Author? author, Footer? footer,
            {Field|<String->String>*} fields) {
        this.title = title;
        this.type = type;
        this.description = description;
        this.url = url;
        this.timestamp = timestamp;
        this.color = color;
        this.thumbnail = thumbnail;
        this.video = video;
        this.image = image;
        this.provider = provider;
        this.author = author;
        this.footer = footer;
        this.fields = fields.map((element) => if (is Field element) then element else Field(element.key, element.item, false));
    }

}

shared class Thumbnail(url, proxiedUrl, height, width) {

    shared String? url;

    shared String? proxiedUrl;

    shared Integer? height;

    shared Integer? width;
}

shared class Video(url, height, width) {

    shared String? url;

    shared Integer? height;

    shared Integer? width;
}

shared class Image(url, proxiedUrl, height, width) {

    shared String? url;

    shared String? proxiedUrl;

    shared Integer? height;

    shared Integer? width;
}

shared class Provider(name, url) {

    shared String? name;

    shared String url;
}

shared class Author(name, url, iconUrl, proxiedIconUrl) {

    shared String? name;

    shared String? url;

    shared String? iconUrl;

    shared String? proxiedIconUrl;
}

shared class Footer(text, iconUrl, proxiedIconUrl) {

    shared String text;

    shared String? iconUrl;

    shared String? proxiedIconUrl;
}

shared class Field(key, item, inline) {

    shared String key;

    shared String item;

    shared Boolean? inline;
}