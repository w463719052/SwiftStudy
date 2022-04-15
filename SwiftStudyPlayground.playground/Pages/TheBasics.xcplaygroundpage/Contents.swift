//: [Previous](@previous)

import Foundation

//: #####常量和变量
//:声明常量和变量，使用 let 关键字声明常量，使用 var 关键字声明变量。
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
//:也可以在一行上声明多个常量或多个变量，用逗号分隔
var x = 0.0, y = 0.0, z = 0.0
//:如果代码中的存储值不会更改，请始终将其声明为带有let关键字的常量。仅使用变量来存储需要能够更改的值。

//:类型注释，可以在声明常量或变量时提供类型注释，以明确常量或变量可以存储的值类型。通过在常量或变量名称后放置:，后跟要使用的类型名称来编写类型注释。
var welcomeMessage: String
welcomeMessage = "Hello"
//:可以在一行上定义同一类型的多个相关变量，用逗号分隔，并在最终变量名称后添加单个类型注释：
var red, green, blue: Double
//:在实践中，很少需要编写类型注释。如果在定义的时候为常量或变量提供初始值，Swift几乎总是可以推断用于该常量或变量的类型，如类型安全和类型推断中所述。如果没有提供初始值，就需要用类型注释指定类型。

//:命名常量和变量，常量和变量名几乎可以包含任何字符，包括Unicode字符
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
//:常量和变量名称不能包含空格字符、数学符号、箭头、线条和框绘制字符。也不能以数字开头
//:一旦声明了特定类型的常量或变量，就无法以相同名称再次声明它，也无法将其更改为存储其他类型的值。也不能将常量更改为变量或将变量更改为常量。
//:变量的值可以更改为兼容类型的另一个值，常量的值在设置后无法更改
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
//:字符串插入常量或变量的方式：\(常量或变量)
print("The current value of friendlyWelcome is \(friendlyWelcome)")

//: #####注释
//:单行注释用//，多行注释用/* */，多行注释可以嵌套多行注释
//:每个语句结束可以不写分号(;)，但是，如果想在一行上写多个单独的语句，则需要分号
let cat = "🐱"; print(cat)

//: #####整数
//:以8、16、32和64位形式提供有符号和无符号整数。8位无符号整数类型为UInt8，32位有符号整数类型为Int32
//:可以使用.min和.max访问每种整数类型的最小值和最大值：
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
//:在大多数情况下，不需要选择特定大小的整数来在代码中使用。Swift提供了一种额外的整数类型Int和UInt，其大小与当前平台的原生单词大小相同
//:在32位平台上，Int与Int32的大小相同。
//:在64位平台上，Int与Int64的大小相同。
//:除非需要使用特定大小的整数，否则请始终使用Int作为代码中的整数值。这有助于代码一致性和互操作性

//: #####浮点数
/*:
浮点类型可以表示比整数类型更广泛的值范围，并且可以存储比Int中存储的要大得多或小得多的数字,Swift提供了两种有符号浮点数类型：
Double表示64位浮点数，精度至少为小数点后15位。
Float表示32位浮点数，精度可以小到小数点后6位。
要使用的合适浮点类型取决于您需要在代码中使用的值的性质和规范，在这两种类型都合适的情况下，首选Double。
 */

//: #####类型安全和类型推断
//:类型安全要明确代码可使用的类型，不能传递错误类型的值，可以自己指定默认类型，如果没有指定类型，swift会通过类型推断来推断出适当的类型
let meaningOfLife = 42 //没有指定类型，可以推断出为Int类型
let pi = 3.14159 //可推断出为Double，swift推断浮点数类型时总是使用Double，而不是Float

//: #####数字的文字表达
/*:
 整数文字可以写成：
 十进制数字，没有前缀
 二进制数字,0b
 八进制数字,0o
 十六进制数字,0x
 */
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 二进制
let octalInteger = 0o21           // 17 八进制
let hexadecimalInteger = 0x11     // 17 十六进制
/*:
 浮点文字可以是十进制（没有前缀）或十六进制（带有0x前缀）。
 它们必须在小数点的两侧始终有一个数字（或十六进制数字）。
 十进制浮点数也可以有一个可选的指数，用大写或小写e表示；
 1.25e2 表示 125.0。
 1.25e-2 表示 0.0125。
 十六进制浮点必须有一个指数，用大写或小写p表示。
 0xFp2 表示 60.0.
 0xFp-2 表示 3.75.
 */
//:下面这些浮点文字的十进制值都为12.1875：
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
//:数字文字可以包含额外的格式，使其更容易阅读。整数和浮点数都可以用额外的零填充，并可以包含下划线，以帮助提高可读性。这两种格式都不会影响字面的基础值
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//: #####数字类型转换
//:整数转换
let cannotBeNegative: UInt8 = -1 // UInt8无法存储负数，因此这将报告错误
let tooBig: Int8 = Int8.max + 1 //Int8无法存储大于其最大值的数字，因此这也会报告一个错误
//不同数字类型的值不能直接相加，要转换成相同的数字类型
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
//:整数和浮点转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi_1 = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(pi_1)

//: #####类型别名
//:类型别名定义了现有类型的替代名称,可以使用typealias关键字定义类型别名。
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

//: ##### 布尔类型
//:基本的布尔类型Bool。布尔值被称为逻辑值，因为它们只能是真或假,true和false
let orangesAreOrange = true
let turnipsAreDelicious = false
//:使用条件语句（如if语句）时，布尔值特别有用
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
//:Swift的类型安全防止非布尔值被替换为Bool。以下示例报告编译时错误：
let i = 1
if i {
    // 不是bool类型，不能直接这样判断，会报错，应该使用i == 1 来判断
}

//: #####元组
//:元组将多个值分组为单个复合值。元组中的值可以是任何类型，不必是彼此相同的类型。
let http404Error = (404, "Not Found")
//:可以将元组的内容分解为单独的常量或变量，然后像往常一样访问：
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
//:如果只需要元组的一些值，在分解元组时可以用下划线（_）来忽略不需要的元组部分：
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
//:也可以使用从0开始的索引访问元组中的单个元素值：
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")
//:在定义元组时，可以命名元组中的单个元素：
let http200Status = (statusCode: 200, description: "OK")
//:如果定义时有命名元组中的元素，则可以使用元素名称访问这些元素的值：
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")
//:元组对相关值的简单组非常有用。它们不适用于创建复杂的数据结构。如果您的数据结构可能更复杂，请将其建模为类或结构，而不是元组

//: #####可选选项
//:在值可能不存在的情况下，您可以使用可选选项。可选代表两种可能性：要么有一个值，您可以解开可选值来访问该值，要么根本没有值,Swift的可选选项允许您指定任何类型都没有值，用？来表示可选选项
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) //转换后的值被推断类型为“Int？”或“optional Int”
//nil，Swift的可选选项允许指示任何类型都没有值nil
var serverResponseCode: Int? = 404
serverResponseCode = nil
//:不能将nil与非可选常量和变量一起使用。如果代码中的常量或变量在某些情况下需要在没有值的情况下工作，请始终将其声明为适当类型的可选值
//:如果在不提供默认值的情况下定义可选变量，该变量将自动设置为nil
var surveyAnswer: String?
//:可以使用if来判断可选值是否为nil
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
//:如果确定可选内容确实包含一个值，您可以通过在可选名称的末尾添加感叹号来访问其基础值（！）。
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
//使用 ！来访问不存在的可选值会触发运行时错误。在使用之前，请确保可选值包含非nil值

//: #####可选绑定
//:为if语句编写可选绑定，如下所示：
//if let constantName = someOptional {
//    statements
//}
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"

//:可以根据需要在单个if语句中包含尽可能多的可选绑定和布尔条件，并用逗号分隔。如果可选绑定中的任何值为nil，或者任何布尔条件计算为false，则整个if语句的条件被视为false。如果语句等效，请遵循以下内容：
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要！

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // 不需要！

//: #####错误处理
/*:
 使用错误处理来响应程序在执行过程中可能遇到的错误条件。
 与可选选项不同，错误处理允许您确定失败的根本原因，并在必要时将错误传播到程序的另一部分。
 当函数遇到错误条件时，它会抛出错误。然后，该函数的调用者可以捕获错误并做出适当的响应。
 */
func canThrowAnError() throws {
    // this function may or may not throw an error
}
//当调用可以抛出错误的函数时，将try关键字置于表达式之前，Swift会自动将错误传播到当前范围之外，直到它们由捕获子句处理。
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}
//Do语句创建一个新的包含范围，允许将错误传播到一个或多个catch子句。可以使用错误处理来响应不同错误条件
func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}

//: #####断言和先决条件
//:assert只在debug环境下生效，而precondition是debug和release都生效。
//:调用assert(_:_:file:line:)函数来编写断言，此函数传递一个计算为true或false的表达式，如果结果为false，则将显示一条消息
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
//在本例中，如果年龄>= 0计算为true，即如果年龄值为非负数，代码将继续执行。如果年龄值为负值，如上文代码所示，则年龄>= 0计算为false，断言失败，终止应用程序。
//:可以省略断言消息
assert(age >= 0)
//:如果代码已经检查了条件，则使用 assertionFailure(_:file:line:) 函数来指示断言失败。例如：
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}
//:每当条件可能为假时，请使用先决条件，代码必须是真的才能继续执行。例如，使用先决条件检查下标没有越界，或检查函数是否传递了有效值。可以通过调用precondition(_:_:file:line:)函数编写先决条件,如果结果为false，则将显示一条消息
precondition(index > 0, "Index must be greater than zero.")
//:还可以调用preconditionFailure(_:file:line:)函数来指示发生了故障。

//: [Next](@next)

