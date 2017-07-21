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