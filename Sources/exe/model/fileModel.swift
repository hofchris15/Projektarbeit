//
// SwiftServer (Projektarbeit)
// Erstellt von Stefan Moder am 21-7-17.
// FH Joanneum, Kapfenberg
// Gruppe {[ Hofer Christian, Stefan Moder]}
// File: fileModel
//

import Foundation
import PerfectLib
import PerfectLogger
import Glibc


/*
 * change working directory into exe
 */
func setupDir(_: Void) -> Void {
    let workingDir = Dir("./Sources/exe")
    if workingDir.exists {
        do {
            try workingDir.setAsWorkingDir()
            LogFile.debug("Working directory set to \(workingDir.name)")
        } catch {
            LogFile.debug("error in getFile() setting WorkingDir: \(error)")
        }
    } else {
        LogFile.error("Directory \(workingDir.path) does not exist. Main executable not started from root of MVC cannot find resources?")
        exit(2)
    }
    issetup = true
}
var issetup = false


/**
 * helper to access view files
 */
func getFileView(file: String) -> String? {
    return getFile(file: ("./view/public/" + file) )
}

/**
 * gets content of the specified file and returns it as String
 */
func getFile(file: String) -> String? {      //todo: possible change to optional
    LogFile.debug("Trying to access \(file)")

    if (!issetup) {
        LogFile.debug("Seting up Working Directory")
        setupDir()
    }

    let thisFile = File(file)
    LogFile.debug("file set to \(thisFile.path)")
    do {
        try thisFile.open(.readWrite)
    } catch {
        LogFile.error("Could not open file, error: \(error)") //Error
    }
    var content: String? = nil
    defer {
        thisFile.close()
    }
    do {
        content = try thisFile.readString()
    } catch {
        LogFile.error("not able to read File: \(error)") // Error
    }
    return content
}