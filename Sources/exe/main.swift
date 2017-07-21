import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectLogger
import PerfectSession
import PerfectRequestLogger

let server = HTTPServer()
LogFile.debug("init HTTPServer()")

SessionConfig.name = "mobileExtendSession" //Session name which is set as cookie
SessionConfig.idle = 86400  // idle time set to one day

// Optional
SessionConfig.cookieDomain = "localhost"
SessionConfig.IPAddressLock = true //Session is bind to the IP address of the first request
SessionConfig.userAgentLock = true //Session is bind to the user

let sessionDriver = SessionMemoryDriver()

server.setRequestFilters([sessionDriver.requestFilter])
server.setResponseFilters([sessionDriver.responseFilter])

let myLogger = RequestLogger()
// Add the filters
// Request filter at high priority to be executed first
server.setRequestFilters([(myLogger, .high)])
// Response filter at low priority to be executed last
server.setResponseFilters([(myLogger, .low)])

server.addRoutes(makeRoutes())
server.serverPort = 3000
server.documentRoot = "./Sources"
LogFile.info("set config")

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}

