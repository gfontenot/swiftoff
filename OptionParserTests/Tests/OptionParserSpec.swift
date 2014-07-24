import XCTest
import OptionParser

class OptionParserSpec: XCTestCase {
    func testFlagCallbacksCalled() {
        let parser = OptionParser()

        var callbackCalled = false

        parser.onFlag("--flag", short: "-f", description: "foo") { _ in
            callbackCalled = true
        }

        parser.parse(["--flag"])

        XCTAssert(callbackCalled, "The callback should have been called")
    }
}
