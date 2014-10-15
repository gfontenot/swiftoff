import OptionKit
import Functional

let VERSION = "1.4.1"

typealias Arguments = [String]

public struct CLI {
    private let arguments: Arguments

    var parser: OptionParser {
        return OptionParser(definitions: CLIOptions.all)
    }

    public init(arguments: [String]) {
        self.arguments = arguments
    }
}

public extension CLI {
    public var passedOptions: [String] {
        return parseOptions()
    }
}

private extension CLI {
    func parseOptions() -> [String] {
        switch parser.parse(arguments) {
        case .Success(let box):
            let (options, rest) = box.value
            options[CLIOptions.version] >>- printVersion
            options[CLIOptions.help] >>- printHelp(parser)
        default:
            println("Something went insanely wrong. You might want to try again")
            exit(1)
        }

        return arguments
    }

}

struct CLIOptions {
    static var all: [Option] {
        return [version, help]
    }

    static let version = Option(trigger: .Mixed("v", "version"), helpDescription: "Display the version and exit")
    static let help = Option(trigger: .Mixed("h", "help"), helpDescription: "Display this help text and exit")
}

func printVersion(args: [String]) {
    println("Version: \(VERSION)")
    exit(0)
}

func printHelp(parser: OptionParser)(args: [String]) {
    println(parser.helpStringForCommandName("liftoff"))
    exit(0)
}