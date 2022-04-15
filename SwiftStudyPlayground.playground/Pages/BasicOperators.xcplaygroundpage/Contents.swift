//: [Previous](@previous)

import Foundation

//: #### 基本运算符
//:运算符是用于检查、更改或组合值的特殊符号或短语。(+, -, *, /, % 等)

//: #####专门用语
//:运算符有一元、二元或三元：
//一元运算符对单个目标（如-a）进行操作
//二元运算符在两个目标（如2 + 3）上操作
//三元运算符对三个目标进行操作。与C一样，Swift只有一个三元运算(a ? b : c)

//: #####赋值运算
//:赋值运算符（a = b）用b的值初始化或更新a的值
let b = 10
var a = 5
a = b
//:如果赋值的右侧是一个具有多个值的元组，则其元素可以同时分解为多个常量或变量：
var (x, y) = (1, 2)
//:与C和ObjectiveC中的赋值运算符不同，Swift中的赋值运算符本身不会返回值
if x == y {
    // 如果用x = y不返回值，会报错，要用 x == y。
}

//: #####算术运算符
//:Swift支持所有数字类型的四个标准算术运算符：
//加（+）
//减（-）
//乘（*）
//除（/）
//:字符串串联也支持加法运算符
//"hello, " + "world"  // equals "hello, world"

//: #####剩余运算符 (a % b)
// 9 % 4    // equals 1
// -9 % 4   // equals -1
// a % b和a % -b总是给出相同的答案

//: #####复合分配运算符 (+=)
var a1 = 1
a1 += 2
// a最后=3 ，复合赋值运算符不返回值。例如，你不能写let b = a += 2。

//: #####比较运算符
//:Swift 支持以下比较运算符，每个比较运算符都返回一个Bool值，以指示语句是否为真：
//等于（a == b）
//不等于（a！= b）
//大于（a > b）
//小于（a < b）
//大于或等于（a >= b）
//小于或等于（a <= b）
//:比较运算符通常用于条件语句，例如if语句：
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// Prints "hello, world", because name is indeed equal to "world".
//:如果两个元组具有相同的类型和相同数量的值，也可以比较它们。元组从左到右比较如果所有元素都是相等的，那么元组本身就是相等的。例如
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" aren't compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"
//只有当运算符可以应用于各自元组中的每个值时，元组才能与给定运算符进行比较。
("blue", -1) < ("purple", 1)        // 可以比较
("blue", false) < ("purple", true)  // 错误，因为<无法比较布尔值

//: ##### Nil-Coalescing运算符 (a ?? b)
//:如果可选值a有值，就返回这个值，如果a为nil，则返回默认值b。表达式a总是可选类型。表达式b必须与存储在a中的类型匹配。Nil-coalescing运算符是以下代码的缩写：
a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

//: #####范围运算符
//:Swift包括几个范围运算符，它们是表达一系列值的快捷方式。
//:闭区间运算符（a...b）定义了一个从a到b的范围，包括值a和b。a的值不得大于b。
//:当迭代您想要使用所有值的范围时，闭合范围运算符非常有用，例如for-in循环：
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
//:半开区间运算符（a..<b）定义了从a到b运行的范围，但不包括b。a的值不得大于b
//:当您处理基于零的列表（如数组）时，半开放区间特别有用
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
//:单边区间，运算符只在一边有一个值，闭区间运算符对尽可能在一个方向继续的范围有另一种形式
for name in names[2...] {
    print(name)
}
// Brian
// Jack
for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

//:半开区间运算符还有一个单边形式，仅用其最终值书写，最终值不是范围的一部分
for name in names[..<2] {
    print(name)
}
// Anna
// Alex

//:单边范围可用于其他上下文，而不仅仅是下标。您无法迭代省略第一个值的单边范围，因为不清楚迭代应该从哪里开始。您可以迭代省略其最终值的单边范围；但是，由于范围无限期地继续，请确保为循环添加显式结束条件。您还可以检查单边范围是否包含特定值，如下代码所示。
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true

//: #####逻辑运算符
//:逻辑运算符修改或组合布尔逻辑值true和false。Swift支持在的三个标准逻辑运算符：
// NOT (!a)
// AND (a && b)
// OR (a || b)

//:逻辑非运算符（!a）反转布尔值，使true变成false，false变成true
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"

//:逻辑和运算符（a&&b）创建逻辑表达式，其中两个值都必须为true，整体表达式也为true,如果任一值为false，则整体表达式也为false。
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"

//:逻辑或运算符（a || b），其中两个值中只要有一个为true，整个表达式就为true。
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"

//:组合逻辑运算符,可以组合多个逻辑运算符来创建更长的复合表达式
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
//:Swift逻辑运算符&&和||是左关联，所以复合表达式首先计算最左边的子表达式。

//:显式括号:有时，在不严格需要括号时包含括号是有用的，以使复杂表达式的意图更容易阅读
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"


//: [Next](@next)
