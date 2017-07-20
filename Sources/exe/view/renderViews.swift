//
// Created by christian on 20.07.17.
//

import Foundation
import PerfectLib
import PerfectLogger

class renderViews {
    let workingDir = Dir("./Sources/exe/view/public")

    func renderHome() -> String {
        LogFile.debug("renderHome()")
        if !workingDir.exists {
            do{
                try workingDir.create()
                print("working Directory (\(workingDir)) does not exist, so created it.")
            }catch{
                print ("working directory exists")
            }
        } else {
            print("Working Directory is \(workingDir)")
        }

        if workingDir.exists {
            do {
                try workingDir.setAsWorkingDir()
                print("Working directory set.")
            } catch {
                print("Working directory not found.")
            }
        }

        let thisFile = File("home.html")
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
            return content
        } catch {
            print("no Content")
            let content = ""
            return content
        }

    }
}
