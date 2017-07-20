import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectLogger

let server = HTTPServer()
LogFile.debug("init HTTPServer()")

let routes = makeRoutes()
server.addRoutes(routes)
server.serverPort = 3000
LogFile.debug("set config")

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}

