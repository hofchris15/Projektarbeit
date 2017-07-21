//
// Created by christian on 19.07.17.
//

import PerfectHTTP
import PerfectLogger
import PerfectLib

func makeRoutes() -> Routes {
    LogFile.debug("makeRoutes()")
    var routes = Routes()

    routes.add(method: .get, uris: ["/", "index.html"], handler: loginGetHandler)
    routes.add(method: .get, uri: "/style.css", handler: sendStyle)
    routes.add(method: .get, uri: "/images/headerPic.jpg", handler: sendHeaderPic)
    routes.add(method: .get, uri: "/snap.svg-min.js", handler: sendSnapSVG)
    routes.add(method: .get, uri: "/clock.js", handler: sendClock)
    routes.add(method: .get, uri: "/scripts.js", handler: sendScripts)
    routes.add(method: .post, uri: "/login", handler: loginPostHandler)
    /*
routes.add(method: .get, uri: "/new", handler: newGetHandler)
routes.add(method: .post, uri: "/new", handler: newPostHandler)
routes.add(method: .get, uri: "/success", handler: loginHandler)
*/
    return routes
}

func sendClock(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("sendClock()")
    let clock = readClock()
    if clock.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    }
    response.appendBody(string: clock)
    response.completed()
}

func sendScripts(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("sendScripts()")
    let scripts = readScripts()
    if scripts.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    }
    response.appendBody(string: scripts)
    response.completed()
}

func loginGetHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("loginGetHandler()")
    let view = renderHome()
    if view.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    }
    response.appendBody(string: view)
    response.completed()
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

func sendStyle(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("sendStyle()")
    let css = readStyle()
    if css.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    }
    response.appendBody(string: css)
    response.completed()
}

func sendSnapSVG(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("sendSnapSVG")
    let snapsvg = readSnapSVG()
    if snapsvg.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    }
    response.appendBody(string: snapsvg)
    response.completed()
}

func sendHeaderPic(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("sendHeaderPic()")
    do {
        let headerPic = File("./images/headerPic.jpg")
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
