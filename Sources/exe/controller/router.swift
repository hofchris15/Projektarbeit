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
    routes.add(method: .get, uri: "/style.css", handler: sendStyle)
    routes.add(method: .get, uri: "/images/headerPic.jpg", handler: sendHeaderPic)
    routes.add(method: .get, uri: "/snap.svg-min.js", handler: sendSnapSVG)
    routes.add(method: .get, uri: "/clock.js", handler: sendClock)
    routes.add(method: .get, uri: "/scripts.js", handler: sendScripts)
    routes.add(method: .get, uri: "/grade_worker.js", handler: sendWorker)
    routes.add(method: .get, uri: "/images/favicon.ico", handler: sendFavicon)

    return routes
}

/*
 * Controllers
 */

func loginGetHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("loginGetHandler()")
    let view = getFile(file: "login.html")
    if view.characters.count <= 0 { //todo: instead view == nil ? see renderViews
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

func newGetHandler(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("newGetHandler()")
    let new = getFile(file: "registration.html")
    if new.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    }
    response.appendBody(string: new)
    response.completed()
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
    let view = renderHomeView(user: user)
    if view.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    } else {
        response.appendBody(string: view)
        response.completed()
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
    let view = renderGradesView(user: user)
    if view.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    } else {
        response.appendBody(string: view)
        response.completed()
    }
}

func successHandler(request: HTTPRequest, _ response: HTTPResponse){
    LogFile.debug("successHandler()")
    let new = getFile(file: "success.html")
    if new.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    }
    response.appendBody(string: new)
    response.completed()
}


//#######Public Files

func sendStyle(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("sendStyle()")
    let css = getFile(file: "style.css")
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
    let snapsvg = getFile(file: "./javascript/snap.svg-min.js")
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

func sendClock(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("sendClock()")
    let clock = getFile(file: "./javascript/clock.js")
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
    let scripts = getFile(file: "./javascript/scripts.js")
    if scripts.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    }
    response.appendBody(string: scripts)
    response.completed()
}

func sendWorker(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("sendWorker()")
    let scripts = getFile(file: "./javascript/grade_worker.js")
    if scripts.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    }
    response.appendBody(string: scripts)
    response.completed()
}

func sendFavicon(request: HTTPRequest, _ response: HTTPResponse) {
    LogFile.debug("sendFavicon()")
    let scripts = getFile(file: "./images/favicon.ico")
    if scripts.characters.count <= 0 {
        response.status = .notFound
        response.setBody(string: "404 File not Found")
        response.completed()
    }
    response.appendBody(string: scripts)
    response.completed()
}