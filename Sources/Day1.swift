import Foundation
import ArgumentParser

extension AdventOfCode {
    struct Day1: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Day 1: Trebuchet?!",
            subcommands: [Part1.self, Part2.self]
        )
    }
}

extension AdventOfCode.Day1 {
    struct Part1: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Part 1: Only digits"
        )

        @OptionGroup var options: AdventOfCode.Options

        mutating func run() { 
            let input = options.input
            let lines = input.components(separatedBy: .newlines)

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

            print(sum)
        }
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

extension AdventOfCode.Day1 {
    struct Part2: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Part 2: With spelt numbers"
        )

        @OptionGroup var options: AdventOfCode.Options

        mutating func run() { 
            let input = options.input
            let lines = input.components(separatedBy: .newlines)
            
            var combinedNumbers: [Int] = []

            for var line in lines {
                for (index, speltNumberString) in speltNumbersStrings.enumerated() {
                    line = line.replacingOccurrences(of: speltNumberString, with: String("\(speltNumberString.first!)\(index + 1)\(speltNumberString.last!)"))
                }
                
                let numbers = line.compactMap { $0.wholeNumberValue }
                
                guard let first = numbers.first, let last = numbers.last else {
                    continue
                }
                
                let lineCombinedNumbers = Int("\(first)\(last)")!

                combinedNumbers.append(lineCombinedNumbers)
            }

            let sum = combinedNumbers.reduce(0, +)

            print(sum)
        }
    }
}