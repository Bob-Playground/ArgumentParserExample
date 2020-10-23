# swift-argument-parser 使用示例

在编写命令行工具时，使用 [swift-argument-parser](https://github.com/apple/swift-argument-parser) 可方便地读出用户提供的参数，如果参数有误，还会输出命令使用说明。  

## 集成方法和介绍

https://github.com/apple/swift-argument-parser

## 基本用法：以 [HLBRepeat](https://github.com/Bob-Playground/ArgumentParserExample/blob/master/HLBRepeat/HLBRepeat.swift) 为例

说明：另外两个例子 [HLBMath](https://github.com/Bob-Playground/ArgumentParserExample/blob/master/HLBMath/HLBMath.swift  ) 和 [HLBRoll](https://github.com/Bob-Playground/ArgumentParserExample/blob/master/HLBRoll/main.swift) 请直接看源码。  

```swift
import ArgumentParser

struct HLBRepeat: ParsableCommand {
    
    // commandName 参数可以指定命令的名称，在 USAGE 中会用到。
    static let configuration = CommandConfiguration(commandName: "HLBRepeat", version: "0.0.1")
    
    @Flag(help: "Include a counter with each repetition.")
    var includeCounter = false

    @Option(name: .shortAndLong, help: "The number of times to repeat 'phrase'.")
    var count: Int?

    @Argument(help: "The phrase to repeat.")
    var phrase: String

    mutating func run() throws {
        let repeatCount = count ?? 10

        for i in 1...repeatCount {
            if includeCounter {
                print("\(i): \(phrase)")
            } else {
                print(phrase)
            }
        }
    }
}

HLBRepeat.main()
```

## 命令行工具使用示例

进入到生成的二进制可执行文件的目录，然后在终端中输入命令即可。

#### 命令使用出错后，出现相关提示的示例

输入：

```
$./HLBRepeat
```

输出：

```
Error: Missing expected argument '<phrase>'

USAGE: HLBRepeat [--include-counter] [--count <count>] <phrase>

ARGUMENTS:
  <phrase>                The phrase to repeat.

OPTIONS:
  --include-counter       Include a counter with each repetition.
  -c, --count <count>     The number of times to repeat 'phrase'.
  --version               Show the version.
  -h, --help              Show help information.
```

#### 命令正常使用的示例

输入：

```
$ ./HLBRepeat --include-counter -c 3 haha
```

输出：

```
1: haha
2: haha
3: haha
```

## 发布命令行工具

进入 Xcode -> Product -> Archive，按常规步骤打包发布。  

将命令行工具添加到环境变量中即可使用。