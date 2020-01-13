import XCTest
@testable import swiftTox

final class swiftToxTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        print("toxcore version \(swiftTox().toxMajor).\(swiftTox().toxMinor).\(swiftTox().toxPatch)")
        XCTAssertEqual(swiftTox().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
