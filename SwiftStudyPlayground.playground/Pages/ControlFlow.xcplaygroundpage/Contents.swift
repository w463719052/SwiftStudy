//: [Previous](@previous)

import Foundation

//: #### 控制流程

//:for-in循环，可以使用for-in循环迭代序列
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// cats have 4 legs
// ants have 6 legs
// spiders have 8 legs
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
//:如果不需要序列中的每个值，您可以使用下划线代替变量名称来忽略这些值。
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
//: (..<) 半开范围运算符
let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
}
//:使用 stride(from:to:by:) 函数跳过不需要的标记。
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
//:闭合范围也可用，使用 stride（from:through:by:）代替：
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}
//:可以使用for-in语法迭代任何集合，包括您自己的类和集合类型，只要这些类型符合序列协议。

//: while 循环
//:while在每次循环开始时评估其状态。有可能不执行循环
while condition {
    statements
}
//:repeat-while在每次循环结束时评估其状况。至少执行一次循环


//: [Next](@next)
