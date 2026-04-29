import ProjectDescription

let project = Project(
    name: "SwiftUI-MyCalc",
    settings: .settings(configurations: [
        .debug(name: "Debug", xcconfig: "./xcconfigs/SwiftUI-MyCalc.xcconfig"),
        .release(name: "Release", xcconfig: "./xcconfigs/SwiftUI-MyCalc.xcconfig")
    ]),
    targets: [
        .target(
            name: "MyCalc",
            destinations: .iOS,
            product: .app,
            bundleId: "com.goharsha.MyCalc",
            sources: ["Sources/MyCalc/**"],
            dependencies: [],
            settings: .settings(configurations: [
                .debug(name: "Debug", xcconfig: "./xcconfigs/MyCalc.xcconfig"),
                .release(name: "Release", xcconfig: "./xcconfigs/MyCalc.xcconfig")
            ])
        )
    ]
)
