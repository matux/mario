import XCTest
@testable import Mario

final class MarioTests: XCTestCase {

    func testMap() {
        //Pipe.map(3, into: {_ in })
        XCTAssertEqual(Pipe.map(3, into: { $0 + 3 }), 6)
        XCTAssertEqual(Pipe.map("mamma mia!", into: String.uppercased), "MAMMA MIA!")
        XCTAssertEqual((3 + 3 |> Pipe.map) <| { $0 * 2 }, 12)

    }

    func testInout() {
        func plusTwo(x: inout Int) -> Int { return x + 2 }
        var a = 4
        XCTAssertEqual(a &|> plusTwo, 6)
    }

    // TODO: Profile
}

extension MarioTests {

    static var allTests = [
        ("testMap", testMap),
        ("testInout", testInout)
    ]
}

extension String {

    // shadow till https://github.com/apple/swift-evolution/blob/master/proposals/0042-flatten-method-types.md
    // current estimate: TimeInterval.infinity
    static func uppercased(string: String) -> String {
        return string.uppercased()
    }
}
