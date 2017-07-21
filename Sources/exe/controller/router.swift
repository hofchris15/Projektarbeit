//
// Created by christian on 19.07.17.
//

import PerfectHTTP
import PerfectLogger
import PerfectLib

func makeRoutes() -> Routes {
    LogFile.debug("makeRoutes()")
    var routes = Routes()

    //html routes
    routes.add(method: .get, uris: ["/", "index.html"], handler: loginGetHandler)
    routes.add(method: .post, uri: "/", handler: loginPostHandler)
    routes.add(method: .get, uri: "/new", handler: newGetHandler)
    routes.add(method: .post, uri: "/new", handler: newPostHandler)
    routes.add(method: .get, uri: "/success", handler: successHandler)

    routes.add(method: .get, uri: "/home", handler: getHomeHandler)
    routes.add(method: .get, uri: "/schedular", handler: getSchedularHandler)
    routes.add(method: .get, uri: "/grades", handler: getGradesHandler)

    //public files
    let files = [   PublicFile(route: "/style.css"),
                    PublicFile(route: "/javascript/snap.svg-min.js"),
                    PublicFile(route: "/javascript/clock.js"),
                    PublicFile(route: "/javascript/scripts.js"),
                    PublicFile(route: "/javascript/grade_worker.js"),
                    PublicFile(route: "/images/favicon.ico") ]
    for file in files {
        routes.add(method: .get, uri: file.route, handler: file.sendFile)
    }
    routes.add(method: .get, uri: "/images/headerPic.jpg", handler: sendHeaderPic)

    return routes
}

/*
 * Controllers
 */

func loginGetHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("loginGetHandler()")
    if let view = renderLoginView() { // renderLoginView gives either String or nil -> renderLoginView
        response.appendBody(string: view) // String
        response.completed()
    } else { // if nil
            sendFileNotFound(response)
    }
}

func loginPostHandler(request: HTTPRequest, _ response: HTTPResponse){
    LogFile.debug("loginPostHandler()")
    let username: [String] = request.params(named: "username")
    let password: [String] = request.params(named: "password")
    print("username = \(username)")
    print("password = \(password)")
    response.appendBody(string: "loginPostHandler, we are working on it")
    response.completed()
}

func newGetHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("newGetHandler()")
    if let view = renderRegistrationView() {
        response.appendBody(string: view)
        response.completed()
    } else {
        sendFileNotFound(response)
    }
}

func newPostHandler(request: HTTPRequest, _ response: HTTPResponse){
    LogFile.debug("newPostHandler()")
    let username: [String] = request.params(named: "username")
    let password: [String] = request.params(named: "password")
    print("username = \(username)")
    print("password = \(password)")
    response.appendBody(string: "loginPostHandler, we are working on it")
    response.completed()
}

func getHomeHandler(request: HTTPRequest, _ response: HTTPResponse){
    LogFile.debug("getHomeHandler()")
    //request.session?.data["user"] = "Testuser" //fixme testing only remove later
    let user: String = request.session?.data["user"] as? String ?? "No user?"
    if let view = renderHomeView(user: user) {
        response.appendBody(string: view)
        response.completed()
    } else {
        sendFileNotFound(response)
    }
}

func getSchedularHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("getSchedularHandler()")
    response.appendBody(string: renderSchedularView())
    response.completed()
}

func getGradesHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("getGradesHandler()")
    let user: String = request.session?.data["user"] as? String ?? "No user?"
    if let view = renderGradesView(user: user) {
        response.appendBody(string: view)
        response.completed()
    } else {
        sendFileNotFound(response)
    }
}

func successHandler(request: HTTPRequest, _ response: HTTPResponse){
    LogFile.debug("successHandler()")
    if let view = renderSuccessView() {
        response.appendBody(string: view)
        response.completed()
    } else {
        sendFileNotFound(response)
    }
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
            response.setBody(bytes: imageBytes)
        }
    } catch {
        LogFile.debug("error in sendHeaderPic(): \(error)")
        response.status = .internalServerError
        response.setBody(string: "Error handling request: \(error)")
    }
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

/**
 * Sends back a file as response, to be used for static elements
 * -Parameters:
 *      -response: the http response object
 *      -file: to send as response
 */
func simpleSend(_ response: HTTPResponse, _ file: String) {
    if let view = getFileView(file: file) {
        response.appendBody(string: view)
        response.completed()
    } else {
        sendFileNotFound(response)
    }
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
        simpleSend(response, "./" + route)
    }
}
