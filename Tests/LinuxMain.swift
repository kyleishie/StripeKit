import XCTest

import StripeKitTests

var tests = [XCTestCaseEntry]()
tests += StripeKitTests.allTests()
XCTMain(tests)