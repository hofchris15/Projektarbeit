//
// Created by christian on 20.07.17.
//

import Foundation
import PerfectLib
import PerfectLogger

func getFile(file: String) -> String {
    let workingDir = Dir("./Sources/exe/view/public")
    do {
        try workingDir.setAsWorkingDir()
        print("Working directory set to \(workingDir.name)")
    } catch {
        print("Working directory not found.")
    }

    let thisFile = File(file)
    LogFile.debug("file set to \(thisFile)")
    do {
        try thisFile.open(.readWrite)
    } catch {
        print("Could not open file")
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
        print("no Content")
        let content = ""
        return content
    }
}

func renderHome() -> String {
    LogFile.debug("renderHome()")
    let content = getFile(file: "home.html")
    return content
}

func readStyle() -> String{
    LogFile.debug("readStyle()")
    let content = getFile(file: "style.css")
    return content
}