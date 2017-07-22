//
// SwiftServer (Projektarbeit)
// Erstellt von Christian Hofer am 2017-07-22
// FH Joanneum, Kapfenberg
// Gruppe {[ Hofer Christian, Stefan Moder]}
// File: Profile.swift
//


import Foundation
import PerfectLib
import PerfectLogger
import AES256CBC


public class Profile: JSONConvertibleObject {
    static let registerName = "profile"
    var username = ""
    var password = ""
    var firstname = ""
    var lastname = ""
    var email = ""
    var key = ""

    override public init() {
    }


    override public func setJSONValues(_ values: [String: Any]) {
        self.username = getJSONValue(named: "username", from: values, defaultValue: "")
        self.password = getJSONValue(named: "password", from: values, defaultValue: "")
        self.firstname = getJSONValue(named: "firstname", from: values, defaultValue: "")
        self.lastname = getJSONValue(named: "lastname", from: values, defaultValue: "")
        self.email = getJSONValue(named: "email", from: values, defaultValue: "")
        self.key = getJSONValue(named: "key", from: values, defaultValue: "")
    }

    override public func getJSONValues() -> [String: Any] {
        return [
                JSONDecoding.objectIdentifierKey: Profile.registerName,
                "username": username,
                "password": password,
                "firstname": firstname,
                "lastName": lastname,
                "email": email,
                "key": key
        ]
    }
}

public func encrypt(_ user: Profile) -> Profile? {
    LogFile.debug("encrypt()")
    let str = user.password
    let key = AES256CBC.generatePassword()

    let encrypted = AES256CBC.encryptString(str, password: key)

    user.password = encrypted!
    user.key = key

    return user
}

public func storeProfile(profile: Profile) -> Void {
    LogFile.debug("storeProfile()")
    let profileDir = Dir("./profiles/\(profile.username)/")
    if !profileDir.exists {
        do {
            try profileDir.create()
            print("Profile Directory created: \(profileDir)")
        } catch {
            print("not able to create Profile Directory under: \(profileDir)")
        }
    }
    let profFile = File("./profiles/\(profile.username)/\(profile.username).json")
    do {
        try profFile.open(.readWrite)
    } catch {
        LogFile.debug("not able to open file: \(error)")
    }

    defer{
        profFile.close()
    }

    do {
        let json = try profile.jsonEncodedString()
        try profFile.write(string: json)
    } catch {
        LogFile.debug("not able to jsonStringify profile: \(error)")
    }

}

public func readProfile(username: String) -> Profile? {
    LogFile.debug("readProfile()")
    let profileFile = "./profiles/\(username)/\(username).json"
    let prof = getFile(file: profileFile)
    print("get profile from getFile()")
    if prof == nil{
        return nil
    }
    do {
        guard let user = try prof?.jsonDecode() as? Profile else {
            return nil
        }
        return user
    } catch {
        LogFile.debug("not able to jsonDecode user: \(error)")
    }
    return nil
}

public func validate(username: String, password: String) -> Bool {
    LogFile.debug("validate()")
    let user: Profile! = readProfile(username: username)
    let storedPasswd: String = user.password
    let storedKey: String = user.key
    print("storedPasswd = \(storedPasswd), storedKey = \(storedKey)")
    let decrypted = AES256CBC.decryptString(storedPasswd, password: storedKey)
    print("decrypted password = \(decrypted)")
    if password == decrypted {
        return true
    } else {
        return false
    }
}