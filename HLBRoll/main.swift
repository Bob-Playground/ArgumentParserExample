//
//  main.swift
//  HLBRoll
//
//  Created by HuangLibo on 2020/10/23.
//

import ArgumentParser

struct HLBRollOptions: ParsableArguments {
    
    // TODO: 需要修改默认的 commandName
    
    @Option(help: ArgumentHelp("Rolls the dice <n> times.", valueName: "n"))
    var times = 1

    @Option(help: ArgumentHelp(
        "Rolls an <m>-sided dice.",
        discussion: "Use this option to override the default value of a six-sided die.",
        valueName: "m"))
    var sides = 6

    @Option(help: "A seed to use for repeatable random generation.")
    var seed: Int?

    @Flag(name: .shortAndLong, help: "Show all roll results.")
    var verbose = false
}

// If you prefer writing in a "script" style, you can call `parseOrExit()` to
// parse a single `ParsableArguments` type from command-line arguments.
let options = HLBRollOptions.parseOrExit()

let seed = options.seed ?? .random(in: .min ... .max)
var rng = SplitMix64(seed: UInt64(truncatingIfNeeded: seed))

let rolls = (1...options.times).map { _ in
    Int.random(in: 1...options.sides, using: &rng)
}

if options.verbose {
    // Show all roll results
    for (number, roll) in zip(1..., rolls) {
        print("Roll \(number): \(roll)")
    }
}

// 显示总和
print(rolls.reduce(0, +))
