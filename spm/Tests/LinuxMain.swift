import XCTest

import swiftToxTests

var tests = [XCTestCaseEntry]()
tests += swiftToxTests.allTests()
XCTMain(tests)
