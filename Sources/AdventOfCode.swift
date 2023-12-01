import Foundation
import ArgumentParser

@main
struct AdventOfCode: ParsableCommand {
  static let configuration = CommandConfiguration(
    abstract: "Advent of Code solutions",
    subcommands: [Day1.self]
  )

  struct Options: ParsableArguments {
    @Argument(help: "The input data file", transform: URL.init(fileURLWithPath:)) var inputFile: URL

    var input: String {
      try! String(contentsOf: inputFile)
    }

    var lines: [String] {
      input.components(separatedBy: .newlines)
    }

    func validate() throws {
      guard FileManager.default.fileExists(atPath: inputFile.path) else {
        throw ValidationError("The input file does not exist")
      }
    }
  }
}
