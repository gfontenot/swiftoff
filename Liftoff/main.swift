class Option {
    let long: String
    let short: String?
    let desc: String
    let action: (Any) -> ()

    init(long: String, short: String?, desc: String, action: (Any) -> ()) {
        self.long = long
        self.short = short
        self.desc = desc
        self.action = action
    }

    func matches(argument: String) -> Bool {
        return long == argument || short == argument
    }
}

extension Option: Printable {
    var description: String {
    return "Long: \(long)\nShort: \(short)\nDescription: \(desc)\nAction: \(action)"
    }
}

class OptionParser {
    var options: [Option] = []

    func parse(arguments: [String]) {
        for option in options {
            for argument in arguments {
                if option.matches(argument) {
                    option.action("foo")
                }
            }
        }
    }

    func onFlag(long: String, short: String, description: String, action: (Any) -> ()) {
        options += Option(long: long, short: short, desc: description, action: action)
    }
}

let opts = OptionParser()
opts.onFlag("--foo", short: "-f", description: "foo") { _ in
    println("Hello Foo")
}

let arguments = Process.arguments
opts.parse(arguments)
