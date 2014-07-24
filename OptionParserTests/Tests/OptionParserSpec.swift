import XCTest
import OptionParser

class OptionParserSpec: XCTestCase {
    func testFlagCallbacksCalled() {
        let parser = OptionParser()
        var foo = false
        var bar = false

        parser.on("--foo", short: "-f", description: "foo") { _ in
            foo = true
        }

        parser.on("--bar", short: "-b", description: "bar") { _ in
            bar = true
        }

        parser.parse(["--foo"])

        XCTAssert(foo, "The callback should have been called if the flag was passed")
        XCTAssert(bar == false, "The callback should not have been called if the flag wasn't passed")
    }

    func testStringOptionReturnsString() {
        let parser = OptionParser()
        var returnString = ""

        parser.on("--flag", short: "-f", description: "foo") { argument in
            if let string = argument as? String {
                returnString = string
            }
        }

        parser.parse(["--flag", "foo"])

        XCTAssert(returnString == "foo", "string option callbacks should return the passed argument")
    }
}
