import Algorithms
import Foundation

struct Day01: AdventDay {
  var data: String

  var lines: [String] {
    data.components(separatedBy: .newlines)
  }

  func part1() -> Any {
    var combinedNumbers: [Int] = []

    for line in lines {
      let numbers = line.compactMap { $0.wholeNumberValue }

      guard let first = numbers.first, let last = numbers.last else {
        continue
      }

      let lineCombinedNumbers = Int("\(first)\(last)")!

      combinedNumbers.append(lineCombinedNumbers)
    }

    let sum = combinedNumbers.reduce(0, +)

    return sum
  }

  func part2() -> Any {
    var combinedNumbers: [Int] = []

    for var line in lines {
      for (index, speltNumberString) in speltNumbersStrings.enumerated() {
        line = line.replacingOccurrences(
          of: speltNumberString,
          with: String("\(speltNumberString.first!)\(index + 1)\(speltNumberString.last!)"))
      }

      let numbers = line.compactMap { $0.wholeNumberValue }

      guard let first = numbers.first, let last = numbers.last else {
        continue
      }

      let lineCombinedNumbers = Int("\(first)\(last)")!

      combinedNumbers.append(lineCombinedNumbers)
    }

    let sum = combinedNumbers.reduce(0, +)

    return sum
  }
}

let speltNumbersStrings = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

extension Substring {
  var wholeNumberValue: Int? {
    if let index = speltNumbersStrings.firstIndex(of: String(self)) {
      return index + 1
    } else {
      return nil
    }
  }
}
