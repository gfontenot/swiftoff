import OptionKit

public func doShit(argv: [String]) {
    let opt1 = Option(trigger:.Mixed("e", "echo"))
    let opt2 = Option(trigger:.Mixed("h", "help"))
    let opt3 = Option(trigger:.Mixed("a", "allow-nothing"))
    let opt4 = Option(trigger:.Mixed("b", "break-everything"))
    let opt5 = Option(trigger:.Mixed("c", "counterstrike"))
    let parser = OptionParser(definitions:[opt1, opt3, opt4, opt5])
    
    let result = parser.parse(argv)
    
    switch result {
    case .Success(let box):
        let (options, rest) = box.value
        if options[opt1] != nil {
            println("\(rest)")
        }
        
        if options[opt2] != nil {
            println(parser.helpStringForCommandName("optionTest"))
        }
        
    case .Failure(let err):
        println(err)
    }
}