shared class HttpResponseException(Integer code, String reason, Throwable? cause = null)
        extends Exception("``code``: ``reason``", cause) {}