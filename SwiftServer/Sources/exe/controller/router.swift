//
// Created by christian on 19.07.17.
//

import PerfectHTTP
import PerfectLogger
import PerfectLib
import PerfectSession
import PerfectWebSockets
import Foundation
import Gzip

func makeRoutes() -> Routes {
    LogFile.debug("makeRoutes()")
    var routes = Routes()

    //html routes
    routes.add(method: .get, uris: ["/", "index.html"], handler: loginGetHandler)
    routes.add(method: .post, uri: "/", handler: loginPostHandler)
    routes.add(method: .get, uri: "/new", handler: newGetHandler)
    routes.add(method: .post, uri: "/new", handler: newPostHandler)
    routes.add(method: .get, uri: "/success", handler: successHandler)
    routes.add(method: .get, uri: "/logout", handler: logoutHandler)
    // Chat connection
    routes.add(method: .get, uri: "/socket", handler: {
        request, response in
        WebSocketHandler(handlerProducer: {
            (request: HTTPRequest, protocols: [String]) -> WebSocketSessionHandler? in
            guard protocols.contains("chat") else {
                LogFile.debug("Connection failed. Client use invalid protocols \(protocols)")
                return nil
            }
            return ChatHandler()
        }).handleRequest(request: request, response: response)
        LogFile.debug("Starting Socket connection")
    })

    routes.add(method: .get, uri: "/chat", handler: chatHandler)

    routes.add(method: .get, uri: "/home", handler: getHomeHandler)
    routes.add(method: .get, uri: "/schedular", handler: getSchedularHandler)
    routes.add(method: .get, uri: "/grades", handler: getGradesHandler)
    routes.add(method: .get, uri: "/map", handler: getMapHandler)

    //public files
    let files = [PublicFile(route: "/style.css"),
                 PublicFile(route: "/javascript/snap.svg-min.js"),
                 PublicFile(route: "/javascript/clock.js"),
                 PublicFile(route: "/javascript/scripts.js"),
                 PublicFile(route: "/javascript/grade_worker.js"),
                 PublicFile(route: "/javascript/chatFunctions.js"),
                 PublicFile(route: "/javascript/socket.io.js"),
                 PublicFile(route: "/images/favicon.ico"),
                 PublicFile(route: "/javascript/geolocation.js")]
    for file in files {
        routes.add(method: .get, uri: file.route, handler: file.sendFile)
    }
    routes.add(method: .get, uri: "/images/headerPic.jpg", handler: sendHeaderPic)

    return routes
}

/*
 * Controllers
 */

func loginGetHandler(_ request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("loginGetHandler()")
    if let view = renderLoginView("") { // renderLoginView gives either String or nil -> renderLoginView
        response.appendBody(bytes: compress(view)) // String
	response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
        sevenDayCaching(response)
        response.completed()
    } else { // if nil
        sendFileNotFound(response)
    }
}

func loginPostHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("loginPostHandler()")
    var msg: String
    msg = fileExist(username: request.params(named: "username")[0])
    if msg == Message.nouser {
        let view = renderLoginView(msg)
        response.status = .forbidden
        response.appendBody(bytes: compress(view!))
	response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
    } else {
        msg = validate(username: request.params(named: "username")[0], password: request.params(named: "password")[0])
        if msg == Message.fail {
            let view = renderLoginView(msg)
            response.status = .forbidden
            response.appendBody(bytes: compress(view!))
            response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
        } else {
            request.session?.data["user"] = request.params(named: "username")[0]
            response.status = .seeOther
            response.setHeader(.location, value: "/home")
        }
    }
    response.completed()
}

func newGetHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("newGetHandler()")
    if let view = renderRegistrationView() {
        response.appendBody(bytes: compress(view))
	response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
        sevenDayCaching(response)
        response.completed()
    } else {
        sendFileNotFound(response)
    }
}

func newPostHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("newPostHandler()")
    var user = Profile()
    user.username = request.params(named: "username")[0]
    user.password = request.params(named: "password")[0]
    user.firstname = request.params(named: "firstname")[0]
    user.lastname = request.params(named: "lastname")[0]
    user.email = request.params(named: "email")[0]
    user = encrypt(user)!
    storeProfile(profile: user)
    sendSeeOther(response, value: "/success")
}

func getHomeHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("getHomeHandler()")
    var user = ""
    if let val = request.session?.data["user"] as? String {
        user = val
    }
    if user == "" {
        loginGetHandler(request, response)
    } else {
        if let view = renderHomeView(user: user) {
            response.appendBody(bytes: compress(view))
	    response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
            sevenDayCaching(response)
            response.completed()
        } else {
            sendFileNotFound(response)
        }
    }
}

func getSchedularHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("getSchedularHandler()")
    var user = ""
    if let val = request.session?.data["user"] as? String {
        user = val
    }
    if user == "" {
        loginGetHandler(request, response)
    } else {
        response.appendBody(bytes: compress(renderSchedularView()))
	response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
        sevenDayCaching(response)
        response.completed()
    }
}

func getGradesHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("getGradesHandler()")
    var user = ""
    if let val = request.session?.data["user"] as? String {
        user = val
    }
    if user == "" {
        loginGetHandler(request, response)
    } else {
        if let view = renderGradesView(user: user) {
            response.appendBody(bytes: compress(view))
	    response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
            sevenDayCaching(response)
            response.completed()
        } else {
            sendFileNotFound(response)
        }
    }
}

func getMapHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("getMapHandler()")
    var user = ""
    if let val = request.session?.data["user"] as? String {
        user = val
    }
    if user == "" {
        loginGetHandler(request, response)
    } else {
        if let view = renderMapView(user: user) {
            response.appendBody(bytes: compress(view))
	    response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
            sevenDayCaching(response)
            response.completed()
        } else {
            sendFileNotFound(response)
        }
    }
}

func successHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("successHandler()")
    if let view = renderSuccessView() {
        response.appendBody(bytes: compress(view))
	response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
        sevenDayCaching(response)
        response.completed()
    } else {
        sendFileNotFound(response)
    }
}

func chatHandler(request: HTTPRequest, response: HTTPResponse) {
    LogFile.debug("chatHandler()")
    if let user = request.session?.data["user"] as? String {
        if let view = renderChatView(user: user) {
            response.appendBody(bytes: compress(view))
	    response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
            noCaching(response)
            response.completed()
        } else {
            sendFileNotFound(response)
        }
    } else {
        loginGetHandler(request, response)
    }
}

func logoutHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("logoutHandler()")
    if let _ = request.session?.token {
        request.session = PerfectSession()
        response.request.session = PerfectSession()
    }
    sendSeeOther(response, value: "/")
}


//#######Public Files

func sendHeaderPic(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("sendHeaderPic()")
    do {
        let headerPic = File("./view/public/images/headerPic.jpg")
        if headerPic.exists {
            let imageSize = headerPic.size
            let imageBytes = try headerPic.readSomeBytes(count: imageSize)
            response.setHeader(.contentType, value: MimeType.forExtension("jpg"))
            response.setHeader(.contentLength, value: "\(imageBytes.count)")
	    response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
            response.setBody(bytes: [UInt8](try! (Data(imageBytes)).gzipped()) )
        }
    } catch {
        LogFile.debug("error in sendHeaderPic(): \(error)")
        response.status = .internalServerError
        response.setBody(string: "Error handling request: \(error)")
    }
    sevenDayCaching(response)
    response.completed()
}


/*
 * Helper functions
 */

/**
 * File not found response
 */
func sendFileNotFound(_ response: HTTPResponse) -> Void {
    response.status = .notFound
    response.setBody(string: "404 File not Found")
    response.completed()
}

func sendInternalFail(_ response: HTTPResponse) -> Void {
    response.status = .internalServerError
    response.setBody(string: "500 Internal Server Error")
    response.completed()
}

func sendSeeOther(_ response: HTTPResponse, value: String) -> Void {
    response.status = .seeOther
    response.setHeader(.location, value: value)
    response.completed()
}

/**
 * Sends back a file as response, to be used for static elements
 * -Parameters:
 *      -response: the http response object
 *      -file: to send as response
 */
func simpleSend(_ response: HTTPResponse, _ file: String) {
    if let view = getFileView(file: file) {
        response.appendBody(bytes: compress(view))
	response.addHeader(HTTPResponseHeader.Name.contentEncoding, value: "Gzip")
        sevenDayCaching(response)
        response.completed()
    } else {
        sendFileNotFound(response)
    }
}

/**
 * Simple gzip compression
 * Try to compress data else uncompressed
 */
func compress(_ data: String) -> [UInt8] {
	LogFile.debug("Trying to compress data")
	let enc = data.data(using: .utf8)!
	let zipped = try? enc.gzipped()
	return [UInt8](zipped!)
}

/**
 * Small class to simplify sending static public files
 */

class PublicFile {
    public let route: String
    public init(route: String) {
        self.route = route
    }

    public func sendFile(request: HTTPRequest, _ response: HTTPResponse) {
        LogFile.debug("sendPublicFile(\(route))")
        simpleSend(response, "." + route)
    }
}

