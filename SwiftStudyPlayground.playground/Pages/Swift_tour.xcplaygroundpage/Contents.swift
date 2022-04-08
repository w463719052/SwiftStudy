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
//:通过用大括号（{}）包围代码来编写没有名称的闭包。用于将参数分开，并将类型与正文返回。
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
//:当闭包的类型已经已知时，例如委托的回调，可以省略其参数的类型、返回类型或两者兼而有之。
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
//:按数字而不是名称引用参数——这种方法在非常短的闭包中特别有用。当闭包是函数的唯一参数时，可以完全省略括号。
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

//: #####对象和类
//:使用在 class 类名称 {} 的方式创建类，类的属性也用常量和变量的方式创建，方法和函数声明也是一样的
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
//:通过在类名称后面加上()来创建类的实例。使用.点语法访问实例的属性和方法。
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
//:在创建实例时设置类的初始化器,使用init创建一个。
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
/*:
 创建类的实例时，初始化器的参数会像函数调用一样传递，使用self.来给对应属性赋值，每个属性都需要分配一个值
 如果需要在处理对象之前执行一些清理，使用deinit创建去初始化器。
 子类在类名后面包括其超类名称，由:分隔，如果不需要超类的任何规范，可以省略超类。
 在子类中使用override 来重写超类的方法
 */
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()
//:除了存储的简单属性外，属性还有对应的get和set方法,set方法有隐式名称newValue
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)
//:如果不需要计算属性，可以使用 willSet和didSet来提供在设置新值之前和之后运行的代码。
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
//:使用可选值可以在方法、属性和下标等操作之前用 ? 来进行表示，如果?号之前的内容就是nil，那？后的内容就会被忽略掉
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

//: #####枚举和结构
//:使用enum 创建枚举，与类和所有其他命名类型一样，枚举可以有与之关联的方法。默认情况下，分配原始值从0开始，每次增加1，但是可以通过显式指定值来更改此行为，例如下面的示例，ace被显式地赋予了1的原始值，其余的原始值按顺序分配。还可以使用字符串或浮点数作为枚举的原始类型。使用rawValue属性访问枚举案例的原始值。
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
//:使用init?(rawValue:)初始化器，用于从原始值进行枚举实例，如果没有匹配的值，则返回nil
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}
//:枚举的值是实际值，而不仅仅是书写其rawValue的另一种方式，如果rawValue没有意义，不必提供
enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
//:枚举也可以是关联值，这些值在创建实例时确定，可以认为关联值的行为类似于枚举实例的存储属性
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}
/*:
 使用struct创建结构，struct支持许多与class相同的行为，包括方法和初始化器。struct和class之间最重要的区别之一是，struct在代码中传递时总是被复制，指向两个不同的地址，修改复制体的值不会影响被复制体的值，但class是通过引用传递的，两个类是指向同一个地址。
 struct定义结构体类型时其成员可以没有初始值，如果使用这种格式定义一个类，编译器是会报错的，他会提醒你这个类没有被初始化。
 所有的struct都有一个自动生成的成员构造器，而class需要自己生成 init。
 struct对于let声明的实例不能对变量进行赋值，class预设值是可以赋值let实例的
 struct的方法要去修改property的值，要加上mutating，class则不需要
 struct不能继承，class可以继承
*/
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//: #####协议和扩展
//:使用protocol声明协议
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
//:类、枚举和结构都可以采用协议。
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
//:使用extension扩展为现有类型添加功能，例如新方法和计算属性。可以使用扩展程序为其他地方声明的类型添加协议一致性，甚至添加到您从库或框架导入的类型
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

//: #####错误处理
//:使用任何采用错误协议的类型表示错误。
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
//:使用throw抛出函数中的错误。如果在函数中抛出错误，该函数将立即返回，调用该函数的代码将处理该错误。
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}
//:有几种方法可以处理错误，一种方法是使用do-catch。在do块中，在可能抛出错误的代码前加try。在catch块内，处理抛出的error。
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
//:您可以提供多个catch blocks来处理特定错误
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
//:处理错误的另一种方法是使用try？将结果转换为可选结果。如果函数抛出错误，则放弃特定错误，结果为nil
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
//:使用defer编写一个代码块，该代码在函数返回之前在函数中的所有其他代码之后执行，无论函数是否抛出错误，代码都会被执行
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)

//: #####通用
//:在<>内写一个名称，以形成一个通用函数或类型。
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)
//:可以制作函数和方法的通用形式，以及类、枚举和结构。
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
//:使用where来指定需求清单，例如要求类型实现协议，要求两种类型相同，或要求类具有特定的超类。
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

