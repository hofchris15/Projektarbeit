//
// Created by christian on 20.07.17.
//

import Foundation
import PerfectLib
import PerfectLogger

/// pre read layout
var layout: String! = nil
func setupLayout() -> Void {
    if (layout == nil) {
        layout = getFileView(file: "layout.html") ?? "Layout failed {{ main }}!!"
    }
}


func renderLoginView() -> String? { //returns String or nil
    LogFile.debug("Rendering Login")
    setupLayout()
    var view = getFileView(file: "login.html")
    view = layout.replacingOccurrences(of: "{{ main }}", with: view ?? "Missing main")
    return view
}

func renderHomeView(user: String) -> String? {
    LogFile.debug("Rendering Home")
    setupLayout()
    var view = getFileView(file: "home.html")
    view = view?.replacingOccurrences(of: "{{ user }}", with: user)
    view = layout.replacingOccurrences(of: "{{ main }}", with: view ?? "Missing main")
    return view
}

func renderGradesView(user: String) -> String? {
    LogFile.debug("Rendering Grades")
    setupLayout()
    var view = getFileView(file: "grades.html")
    view = view?.replacingOccurrences(of: "{{ user }}", with: user)
    view = layout.replacingOccurrences(of: "{{ main }}", with: view ?? "Missing main")
    return view
}

func renderRegistrationView() -> String? {
    LogFile.debug("Rendering New")
    setupLayout()
    var view = getFileView(file: "registration.html")
    view = layout.replacingOccurrences(of: "{{ main }}", with: view ?? "Missing main")
    return view
}

func renderSuccessView() -> String? {
    LogFile.debug("Rendering Success")
    setupLayout()
    var view = getFileView(file: "success.html")
    view = layout.replacingOccurrences(of: "{{ main }}", with: view ?? "Missing main")
    return view
}

func renderSchedularView() -> String {
    LogFile.debug("Rendering iframe Schedular")
    return "<h1>Stundenplan</h1>\n<iframe src=\"http://almaty.fh-joanneum.at/stundenplan/\">\n</iframe>"
}
