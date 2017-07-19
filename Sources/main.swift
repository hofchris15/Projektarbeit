import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()

server.serverPort = 3000

let routes = makeRoutes()
server.addRoutes(routes)

do {
	try server.start()
} catch PerfectError.networkError(let err, let msg){
	print("Network error thrown: \(err) \(msg)")
}

