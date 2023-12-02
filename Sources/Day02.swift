import Algorithms
import Foundation

struct Day02: AdventDay {
  var data: String

  var lines: [String] {
    data.components(separatedBy: .newlines)
  }

  func part1() -> Any {
    let games = lines.map(Game.init(from:))

    let validGames = games.filter { game in
      for draw in game.draws {
        if draw.red > 12 || draw.green > 13 || draw.blue > 14 {
          return false
        }
      }
      return true
    }

    let sum = validGames.reduce(0) { $0 + $1.id }

    return sum
  }

  func part2() -> Any {
    let games = lines.map(Game.init(from:))

    let gamePowers = games.map { game in
      var topRed = 0
      var topGreen = 0
      var topBlue = 0

      for draw in game.draws {
        if draw.red > topRed {
          topRed = draw.red
        }
        if draw.green > topGreen {
          topGreen = draw.green
        }
        if draw.blue > topBlue {
          topBlue = draw.blue
        }
      }

      return topRed * topGreen * topBlue
    }

    let sum = gamePowers.reduce(0, +)

    return sum
  }

  struct Game {
    let id: Int
    let draws: [Draw]

    struct Draw {
      var red = 0
      var blue = 0
      var green = 0

      init(from string: String) {
        let colorsDrawn = string.components(separatedBy: ", ").map {
          $0.components(separatedBy: " ")
        }

        for colorDrawn in colorsDrawn {
          switch colorDrawn.last {
          case "red":
            red = Int(colorDrawn.first!)!
          case "blue":
            blue = Int(colorDrawn.first!)!
          case "green":
            green = Int(colorDrawn.first!)!
          default:
            fatalError("Unknown color")
          }
        }
      }
    }

    init(from line: String) {
      let components = line.components(separatedBy: ": ")

      id = Int(components.first!.components(separatedBy: " ").last!)!

      let drawStrings = components.last!.components(separatedBy: "; ")

      draws = drawStrings.map(Draw.init(from:))
    }
  }
}
