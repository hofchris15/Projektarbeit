//
// Created by christian on 24.07.17.
//

import Foundation
import PerfectHTTP

func sevenDayCaching(_ response: HTTPResponse) -> Void {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEE, dd MMM yyyy hh:mm:ss zzz"
    let sevenDaysFromNow = formatter.string(from: Date(timeIntervalSinceNow: 10080 * 60))
    response.addHeader(.cacheControl, value: "public, max-age=604800000")
    response.addHeader(.pragma, value: "cache")
    response.addHeader(.expires, value: sevenDaysFromNow)
}

func noCaching(_ response: HTTPResponse) -> Void {
    response.addHeader(.cacheControl, value: "no-cache, no-store, must-revalidate")
    response.addHeader(.pragma, value: "no-cache")
    response.addHeader(.expires, value: "max-age=0")
}