//
// Created by christian on 19.07.17.
//

import PerfectHTTP

func makeRoutes() -> Routes {
    var routes = Routes()

    routes.add(method: .get, uris ["/", "index.html"], handler: indexHandler)
    routes.add(method: .get, uri: "/login", handler: echoHandler)
}