import OptionParser

let opts = OptionParser()
opts.on("--foo", short: "-f", description: "foo") { _ in
    println("Hello Foo")
}

let arguments = Process.arguments
opts.parse(arguments)
