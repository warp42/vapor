// swift-tools-version:4.0
import PackageDescription

#if os(macOS)
    let tlsImpl: Target.Dependency = "AppleTLS"
#else
    let tlsImpl: Target.Dependency = "OpenSSL"
#endif

let package = Package(
    name: "Vapor",
    products: [
        .library(name: "Vapor", targets: ["Vapor"]),
    ],
    dependencies: [
        // 💻 APIs for creating interactive CLI tools.
        .package(url: "https://github.com/vapor/console.git", from: "3.0.0-rc.2"),

        // 🌎 Utility package containing tools for byte manipulation, Codable, OS APIs, and debugging.
        .package(url: "https://github.com/vapor/core.git", from: "3.0.0-rc.2"),

        // 🔑 Hashing (BCrypt, SHA, HMAC, etc), encryption, and randomness.
        .package(url: "https://github.com/vapor/crypto.git", from: "3.0.0-rc.2"),

        // 🗄 Core services for creating database integrations.tttttttttttt
        .package(url: "https://github.com/vapor/database-kit.git", from: "1.0.0-rc.2"),

        // 🚀 Non-blocking, event-driven HTTP for Swift built on Swift NIO.
        .package(url: "https://github.com/vapor/http.git", from: "3.0.0"),

        // 🏞 Parses and serializes multipart-encoded data with Codable support.
        .package(url: "https://github.com/vapor/multipart.git", from: "3.0.0"),

        // 🚍 High-performance trie-node router.
        .package(url: "https://github.com/vapor/routing.git", from: "3.0.0-rc.2"),

        // 📦 Dependency injection / inversion of control framework.
        .package(url: "https://github.com/vapor/service.git", from: "1.0.0-rc.2"),

        // 🖋 Easy-to-use foundation for building powerful templating languages in Swift.
        .package(url: "https://github.com/vapor/template-kit.git", from: "1.0.0-rc.2"),

        // 📝 Parses and serializes url-encoded form data with Codable support.
        .package(url: "https://github.com/vapor/url-encoded-form.git", from: "1.0.0"),

        // ✅ Extensible data validation library (email, alphanumeric, UUID, etc)
        .package(url: "https://github.com/vapor/validation.git", from: "2.0.0-rc.2"),

        // 🔌 Non-blocking, event-driven WebSocket client and server built on Swift NIO.
        .package(url: "https://github.com/vapor/websocket.git", from: "1.0.0"),
    ],
    targets: [
        // Boilerplate
        .target(name: "Boilerplate", dependencies: ["Service", "Routing", "Vapor"]),
        .target(name: "BoilerplateRun", dependencies: ["Boilerplate"]),

        // Vapor
        .target(name: "Development", dependencies: ["Vapor"]),
        .target(name: "Vapor", dependencies: [
            "Async",
            "Command",
            "Console",
            "COperatingSystem",
            "Crypto",
            "DatabaseKit",
            "Debugging",
            "HTTP",
            "Logging",
            "Multipart",
            "Routing",
            "Service",
            "TemplateKit",
            "URLEncodedForm",
            "Validation",
            "WebSocket"
        ]),
        .testTarget(name: "VaporTests", dependencies: ["Vapor"]),
    ]
)
