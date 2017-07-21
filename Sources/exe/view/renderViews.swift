//
// Created by christian on 20.07.17.
//

import Foundation
import PerfectLib
import PerfectLogger

func getFile(file: String) -> String {

    let workingDir = Dir("./Sources/exe/view/public")
    if workingDir.exists {
        do {
            try workingDir.setAsWorkingDir()
            LogFile.debug("Working directory set to \(workingDir.name)")
        } catch {
            LogFile.debug("error in getFile() setting WorkingDir: \(error)")
        }
    }

    let thisFile = File(file)
    LogFile.debug("file set to \(thisFile.path)")
    do {
        try thisFile.open(.readWrite)
    } catch {
        LogFile.debug("Could not open file, error: \(error)")
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
        LogFile.debug("not able to read File: \(error)")
        let content = ""
        return content
    }
}

func renderHome() -> String {
    LogFile.debug("renderHome()")
    let content = getFile(file: "login.html")
    return content
}

func readStyle() -> String {
    LogFile.debug("readStyle()")
    let content = getFile(file: "style.css")
    return content
}

func readSnapSVG() -> String {
    LogFile.debug("readSnapSVG()")
    let content = getFile(file: "./javascript/snap.svg-min.js")
    return content
}

func readClock() -> String {
    LogFile.debug("readClock()")
    let content = getFile(file: "./javascript/clock.js")
    return content
}

func readScripts() -> String {
    LogFile.debug("readScripts()")
    let content = getFile(file: "./javascript/scripts.js")
    return content
}