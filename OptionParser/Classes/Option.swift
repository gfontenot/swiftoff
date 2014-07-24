struct Option {
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
