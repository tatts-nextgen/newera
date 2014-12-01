class DomainFilters {

    def filters = {

        wwwCheck(uri: '/**') {
            /* Redirect www. requests to root domain */
            before = {
                if (request.serverName.toLowerCase().startsWith('www.')) {
                    int port = request.serverPort

                    if (request.scheme.equalsIgnoreCase('http') && port == 80) {
                        port = -1
                    }

                    URL redirectURL =
                        new URL(request.scheme, request.serverName.replaceFirst('www.',''), port, request.forwardURI)

                    redirect url: redirectURL.toString(), permanent: true
                    return false
                }
            }
        }

    }

}
