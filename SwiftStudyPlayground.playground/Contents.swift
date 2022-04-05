import UIKit

/*:
 单行注释, 开启单行markup
 //: code

 多行注释
 /*
 code
 */
 
 # 一级标题
 ## 二级标题
 
 ## 无序列表
 - 第一行无序列表
 - 第二行无序列表
 
 ## 有序列表
 1. 第一行有序列表
 2. 第二行有序列表
 
 ## 笔记
 > 这里是笔记的内容
 
 ## 一条分割线
 ---
 
 ## 图片
 ![Image](image.png "Local image")

 ## 链接
 [xxxx](https://xxxxxx.com)
 
 ## 粗体
 这是**粗体 使用两个乘号包围**
 
 ## 斜体
 这是*斜体 使用单个乘号包围*
 
 //: [上一页](@previous)
 //: [下一页](@next)  上页下页的顺序由你创建的 Page 顺序决定, 它是可以调整的
 //: [主页](MainPage) 这里直接写你创建的 Page 的名字

*/

//: ### 万物起源
print("Hello,World!")

//: #####简单值
//: let 定义常量
let myConstant = 42
//: var 定义变量
var myVariable = 42
myVariable = 50
//:常量和变量分配的值必须是相同的类型，可以指定类型(在命名后用:分隔)，也可以在创建时提供初始值让编译器自动推倒类型
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
//:值永远不会被隐式转换为另一种类型。如果需要将值转换为其他类型，请显式制作所需类型的实例,下面的例子要先把类型是int的width转化成string才能拼接
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
//:更简单的方式将值包含在字符串中 \(....)
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
//:多行文本用“”“ ”“”
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

//:使用[]来创建数组和字典，通过索引和key值来访问更新元素
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
//: .append 添加数组元素
shoppingList.append("blue paint")
print(shoppingList)
//:创建空的数组或字典的初始化语法
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]
//:如果可推断类型可以不用指定类型
shoppingList = []
occupations = [:]

//: #####控制流程
//: 使用if和switch进行条件判断，使用for-in，while，repeat-while进行循环
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//: 可选值（就是可能是nil的值）要用加 ？来表示
var optionalString: String? = "Hello"
print(optionalString == nil)
//如果设置optionalName为nil的话结果会不同
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
//: 处理可选值的另一个方法是用 ?? 来提供默认值，如果可选值为空，则使用默认值
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"

//:switch支持任何类型的数据和各种各样的比较操作——它们不限于整数和等式测试
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
//:使用for-in为每个键值对提供一对名称来迭代字典中的项目。字典是无序集合，因此它们的键和值以任意顺序迭代,_表示不定义变量名。
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
//:使用while（先判断再开始循环）或者repeat-while（先进行一次循环再开始判断）重复代码块，直到条件发生变化。循环的条件可以是末端，确保循环至少运行一次。
var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)
//:使用 ..< （不包含上限值）或 ... （包含上限值）设置循环的索引范围
var total = 0
for i in 0..<4 {
    total += i
}
print(total)
total = 0
for i in 0...4 {
    total += i
}
print(total)

//: #####函数声明和闭包
//:使用func声明函数。函数名称(各种传参) -> 返回类型 {}
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")
//:函数传参时的标签默认情况下是用参数名称，也可以在参数名称之前写一个自定义参数标签，或者使用_来表示不使用参数标签
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")
//:使用元组tuple（使用圆括号把多个值组合成一个复合值），从函数返回多个值。元组的元素可以通过名称或数字引用
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)
//:函数可以嵌套。嵌套函数可以访问外部函数中声明的变量
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()
//:一个函数可以返回另一个函数作为其值
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)
//:一个函数可以将另一个函数作为其参数之一
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)
