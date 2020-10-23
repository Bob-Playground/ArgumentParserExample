//
//  HLBRepeat.swift
//  HLBRepeat
//
//  Created by HuangLibo on 2020/10/23.
//

import ArgumentParser

@main
struct HLBRepeat: ParsableCommand {

    // commandName 参数可以指定命令的名称，在 USAGE 中会用到。
    static var configuration = CommandConfiguration(commandName: "HLBRepeat", version: "0.0.1")
    
    @Flag(help: "Include a counter with each repetition.")
    var includeCounter = false // 默认不包含序号

    @Option(name: .shortAndLong, help: "The number of times to repeat 'phrase'.")
    var count: Int = 1 // 默认只打印一次

    @Argument(help: "The phrase to repeat.")
    var phrase: String

    mutating func run() throws {
        let repeatCount = count

        for i in 1...repeatCount {
            if includeCounter {
                print("\(i): \(phrase)")
            } else {
                print(phrase)
            }
        }
    }
}

//HLBRepeat.main()
