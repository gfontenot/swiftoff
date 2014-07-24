public class OptionParser {
    var options: [Option] = []
    public init() {
    }
}

public extension OptionParser {
    func parse(arguments: [String]) {
        for option in options {
            for argument in arguments {
                if option.matches(argument) {
                    option.action("foo")
                }
            }
        }
    }
}

public extension OptionParser {
    func onFlag(long: String, short: String, description: String, action: (Any) -> ()) {
        options += Option(long: long, short: short, desc: description, action: action)
    }
}