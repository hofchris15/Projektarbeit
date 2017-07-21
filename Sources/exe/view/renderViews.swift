//
// Created by christian on 20.07.17.
//

import Foundation
import PerfectLib
import PerfectLogger
import Glibc

func getFile(file: String) -> String {      //todo: possible change to optional

    var workingDir = Dir("./Sources/exe/view/public")
    //if workingDir.exists { //fixme on second call never exists => workingDir + ./Source....
        do {
            try workingDir.setAsWorkingDir()
            LogFile.debug("Working directory set to \(workingDir.name)")
        } catch {
            LogFile.debug("error in getFile() setting WorkingDir: \(error)")
        }
    /*} else {
        LogFile.error("\(file): Directory \(workingDir.path) does not exist. Main executable not started from root of MVC cannot find resources?")
        exit(2)
    }*/

    let thisFile = File(file)
    LogFile.debug("file set to \(thisFile.path)")
    do {
        try thisFile.open(.readWrite)
    } catch {
        LogFile.error("Could not open file, error: \(error)") //Error
    }
    defer {
        thisFile.close()
    }
    do {
        let content = try thisFile.readString()
        let workingDir = Dir("./")
        try workingDir.setAsWorkingDir()
        return content
    } catch {
        LogFile.error("not able to read File: \(error)") // Error
        let content = "" //todo: Change this part to optional?
        return content
    }

}

func renderHomeView(user: String) -> String {
    var view = getFile(file: "home.html")
    view = view.replacingOccurrences(of: "{{ user }}", with: user)
    return view
}

func renderGradesView(user: String) -> String {
    var view = getFile(file: "grades.html")
    view = view.replacingOccurrences(of: "{{ user }}", with: user)
    return view
}

func renderSchedularView() -> String {
    return "<h1>Stundenplan</h1>\n<iframe src=\"http://almaty.fh-joanneum.at/stundenplan/\">\n</iframe>"
}