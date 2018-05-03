shared class NotFoundException()
        extends HttpResponseException(404, "Not found.") {}