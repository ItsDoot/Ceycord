import pw.dotdash.ceycord.api.entity {
    Unique
}

shared interface Attachment satisfies Unique {

    "The unique ID of the attachment."
    shared formal actual String id;

    "The name of the attached file."
    shared formal String filename;

    "The size of the attached file, in bytes."
    shared formal Integer size;

    "The source url of the file."
    shared formal String url;

    "The proxied url of the file."
    shared formal String proxiedUrl;

    "The height of the image. [[null]] if the attachment is not an image."
    shared formal Integer? height;

    "The width of the image. [[null]] if the attachment is not an image."
    shared formal Integer? width;
}