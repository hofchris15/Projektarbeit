import PackageDescription

let package = Package(
	name: "SwiftServer",
	targets: [],
	dependencies: [
		.Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2),
		.Package(url: "https://github.com/PerfectlySoft/Perfect-Logger.git", majorVersion:1),
        .Package(url:"https://github.com/PerfectlySoft/Perfect-Session.git", majorVersion: 1),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-RequestLogger.git", majorVersion: 1),
		.Package(url: "https://github.com/SwiftyBeaver/AES256CBC.git", majorVersion: 1),
		.Package(url: "https://github.com/PerfectlySoft/Perfect-WebSockets.git", majorVersion: 2),
		.Package(url: "https://github.com/1024jp/GzipSwift.git", majorVersion: 3)

    ]
)
