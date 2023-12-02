import XCTest

@testable import AdventOfCode

final class Day01Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
    """

  func testPart1() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "209")
  }

  func testPart2() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "281")
  }
}
