//
// SwiftServer (Projektarbeit)
// Erstellt von Stefan Moder am 23-7-17.
// FH Joanneum, Kapfenberg
// Gruppe {[ Hofer Christian, Stefan Moder]}
// File: Chat
//

import Foundation
import PerfectHTTP
import PerfectLogger
import PerfectLib
import PerfectSession
import PerfectWebSockets

/**
 * Handler for chat
 */
class ChatHandler: WebSocketSessionHandler {
    // Protocol
    let socketProtocol: String? = "chat"

    var user: String? = nil

    func handleSession(request: HTTPRequest, socket: WebSocket) {
        socket.readStringMessage {
            string, op, fin in
            guard let string = string else {
                if let u = self.user {
                    left(by: u)
                    for (_, conn) in chat {
                        conn.sendStringMessage(string: "User \(u) logged out", final: true) {
                            self.handleSession(request: request, socket: socket)
                        }
                    }
                    LogFile.info("User \(u) left Session")
                }
                socket.close()
                return
            }
            if let u = request.session?.token {
                LogFile.info("User \(u) joined Session")
                joined(by: u, on: socket)
            }
            LogFile.debug("Socket:: read:\(string) op:\(op) fin:\(fin)")
            for (user, conn) in chat {
                conn.sendStringMessage(string: string, final: true) {
                    LogFile.debug("Sending to \(user)")
                    self.handleSession(request: request, socket: socket)
                }
            }
        }
    }
}

var chat = [String: WebSocket]()

func joined(by user: String, on socket: WebSocket) {
    chat[user] = socket
    LogFile.info("\(user) joind the chat")
}

func left(by user: String) {
    chat.removeValue(forKey: user)
    LogFile.info("\(user) left the chat")
}
