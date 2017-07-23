//
// Created by christian on 20.07.17.
//

import Foundation
import PerfectLib
import PerfectLogger

/// pre read layout
var layout: String! = nil
var msg: String = ""
func setupLayout() -> Void {
    if (layout == nil) {
        layout = getFileView(file: "layout.html")
    }
}

var navbar: String! = nil
func setupNavBar() -> Void {
    if (navbar == nil) {
        navbar = getFileView(file: "navbar.html") ?? ""
    }
}

/// Build page from layout and navbar withview
func buildView(_ view: String?, _ user: String, _ msg: String) -> String? {
    var result = layout?.replacingOccurrences(of: "{{ main }}", with: view ?? "Partial not found!!")
    result = result?.replacingOccurrences(of: "{{ navbar }}", with: navbar ?? "<a href=\"/\"No navigation</a>")
    result = result?.replacingOccurrences(of: "{{ user }}", with: user)
    result = result?.replacingOccurrences(of: "{{ host }}", with: Config.host)
    result = result?.replacingOccurrences(of: "{{ port }}", with: "\(Config.port)")
    result = result?.replacingOccurrences(of: "{{ message }}", with: msg)
    return result
}

func renderLoginView(_ msg: String) -> String? { //returns String or nil
    LogFile.debug("Rendering Login")
    setupLayout()
    setupNavBar()
    return buildView(getFileView(file: "login.html"), "", msg)
}

func renderChatView(user: String) -> String? {
    LogFile.debug("Rendering Chat")
    setupLayout()
    setupNavBar()
    return buildView(getFileView(file: "chat.html"), user, "")
}

func renderHomeView(user: String) -> String? {
    LogFile.debug("Rendering Home")
    setupLayout()
    setupNavBar()
    return buildView(getFileView(file: "home.html"), user, "")
}

func renderGradesView(user: String) -> String? {
    LogFile.debug("Rendering Grades")
    setupLayout()
    setupNavBar()
    return buildView(getFileView(file: "grades.html"), user, "")
}

func renderRegistrationView() -> String? {
    LogFile.debug("Rendering New")
    setupLayout()
    setupNavBar()
    return buildView(getFileView(file: "registration.html"), "", "")
}

func renderSuccessView() -> String? {
    LogFile.debug("Rendering Success")
    setupLayout()
    setupNavBar()
    return buildView(getFileView(file: "success.html"), "", "")
}

func renderSchedularView() -> String {
    LogFile.debug("Rendering iframe Schedular")
    return "<h1>Stundenplan</h1>\n<iframe src=\"http://almaty.fh-joanneum.at/stundenplan/\">\n</iframe>"
}
