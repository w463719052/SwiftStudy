//: [Previous](@previous)

import Foundation

//: #### 字符串和字符
//:Swift字符串由String类型表示。字符串的内容可以通过各种方式访问，包括作为字符值的集合
//:Swift的String类型与Foundation的NSString类桥接。Foundation还扩展了String，以公开NSString定义的方法。这意味着，如果您导入Foundation，您可以在String上访问这些NSString方法

//:字符串是用双引号包围的字符序列（“ “）。
let someString = "Some string literal value"
//:多行字符串文字：使用多行字符串文字——一个由三个双引号包围的字符序列（“”“  ”“”）
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
//:当您的源代码在多行字符串文字中包含换行符时，该换行符也会出现在字符串的值中。如果您想使用换行符使源代码更容易阅读，但不希望换行符成为字符串值的一部分，请在这些行末尾写一个反斜杠（\）：
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
//:要制作以行提要开头或结尾的多行字符串文字，在第一行或最后一行写空的字符串。例如：
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
//:可以缩进多行字符串以匹配周围的代码，结尾引号（"""）前的空格告诉Swift在所有其他行之前要忽略哪个空格
let linesWithIndentation = """
    This line doesn't begin with whitespace.
        This line begins with four spaces.
    This line doesn't begin with whitespace.
    """
//:字符串文字可以包括以下特殊字符：
//:\0（空字符）、\\（反斜杠）、\t（水平选项）、\n（换行符）、\r（回车）、\"（双引号）、\'（单引号）
//:一个任意的Unicode标量值，写为\u{n}，其中n是一个1-8位十六进制数字
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496
//:扩展字符串分隔符 (#  #) 可以将字符串文字放置在扩展分隔符中，以便在字符串中包含特殊字符
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

//:要创建一个空字符串值，请为变量分配空字符串文字，或使用初始化器语法初始化新的字符串实例
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
//:通过 isEmpty 确定字符串值是否为空：
if emptyString.isEmpty {
    print("Nothing to see here")
}

//:字符
//:可以通过使用for-in循环迭代字符串来访问字符串的单个字符值：
for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶
//:可以通过提供字符类型注释从单个字符文字中创建独立的字符常量或变量：
let exclamationMark: Character = "!"
//:字符串值可以通过将字符值数组作为参数传递给其初始化器来构建：
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"

//:串联字符串和字符，字符串值可以通过（+）来添加（或串联），以创建新的字符串值：
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"
//:还可以使用（+=）将字符串值附加到现有的字符串变量：
var instruction = "look over"
instruction += string2
// instruction now equals "look over there"
//:可以使用String类型的append()方法将字符值附加到字符串变量：
welcome.append(exclamationMark)
// welcome now equals "hello there!"
//:如果拼接多行字符串文字来构建较长字符串的行，那么字符串中的每行都应该以换行符结束，包括最后一行
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
// Prints two lines:
// one
// twothree

let goodStart = """
one
two

"""
print(goodStart + end)
// Prints three lines:
// one
// two
// three

//:字符串插值： 前缀为反斜杠（\）每个项目都包裹在（）中，是一种通过将常量、变量、文字和表达式的值包含在字符串文字中来构建新字符串值的方法。
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"
//:您可以使用扩展字符串分隔符创建包含字符串插值的字符串，否则这些字符将被视为字符串插值
print(#"Write an interpolated string in Swift using \(multiplier)."#)
// Prints "Write an interpolated string in Swift using \(multiplier)."
//:要在使用扩展分隔符的字符串中使用字符串插值，请将反斜杠后的数字符号数量与字符串开头和结尾的数字符号数量匹配。例如：
print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."

//:扩展字符簇，Swift角色类型的每个实例都代表一个扩展的字素集群。扩展字素集群是一个或多个Unicode标量的序列，（当组合时）产生单个人类可读字符。

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
// eAcute is é, combinedEAcute is é  \u{65}是 e
//:扩展字符簇是一种灵活的方式，可以将许多复杂的脚本字符表示为单个字符值
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한
//:扩展字符簇使用于封闭标记的标量（如组合包围圈或U+20DD）能够将其他Unicode标量作为单个字符值的一部分包围：
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝

//:计数字符，要检索字符串中字符值的计数，请使用字符串的计数属性：.count
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"

//:Swift对字符值使用扩展字素集群意味着字符串串联和修改可能并不总是影响字符串的字符数
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"

//: ##### 访问和修改字符串
//:可以通过字符串的方法和属性或使用下标语法访问和修改字符串。
//:使用startIndex属性访问字符串的第一个字符的位置。endIndex属性是字符串中最后一个字符的位置，可以使用字符串的index(before:)和index（after:）方法访问给定索引之前和之后的索引。要访问离给定索引更远的索引，您可以使用index(_:offsetBy:)方法
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

//:使用indices属性访问字符串中单个字符的所有索引。
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "
//:可以在符合Collection协议的任何类型上使用startIndex和endIndex属性以及index（before:）、index（after:）和index（_:offsetBy:）方法。包括字符串，以及集合类型，如数组、字典和集合。


//:插入和移除，要在指定索引处将单个字符插入字符串中，请使用insert(_:at:)方法，在指定索引处插入另一个字符串的内容，请使用insert(contentsOf:at:)方法。
var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)
// welcome now equals "hello!"

welcome1.insert(contentsOf: " there", at: welcome1.index(before: welcome1.endIndex))
// welcome now equals "hello there!"

//:要从指定索引的字符串中删除单个字符，请使用remove(at:)方法，要删除指定范围内的子字符串，请使用removeSubrange(_:)方法：
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"

//:子字符串，从字符串获取子字符串时，结果是Substring的实例，而不是另一个字符串。Swift中的子字符串具有大多数与字符串相同的方法，可以像处理字符串一样使用子字符串。然而，与字符串不同，在对字符串执行操作时，只能使用子字符串很短的时间。如果要把结果存储更长时间，要将子字符串转换为字符串实例
let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)

//:字符串比较：Swift提供了三种比较字符串的方法：字符串和字符等式、前缀等式和后缀等式。
//:字符串和字符等式，相等(==)，不相等(!=)
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"
//:如果字符串具有相同的语言意义和外观，即使它们由不同的Unicode标量组成，它们在规范上也是等价的。
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"
//:相反，英语中使用的拉丁大写字母A（U+0041或“A”）不等同于俄语中使用的西里尔字母A（U+0410或“А”）。在视觉上相似，但没有相同的语言含义：
let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters aren't equivalent.")
}
// Prints "These two characters aren't equivalent."

//:前缀和后缀平等，要检查字符串是否具有特定的字符串前缀或后缀，请调用字符串的hasPrefix(_:)和hasSuffix(_:)方法，这两种方法都采用字符串类型的单个参数并返回布尔值。
//:前缀判断  hasPrefix(_:)
//:后缀判断  hasSuffix(_:)

//:字符串的Unicode表示，UTF-8编码，UTF-16编码，UTF-32编码
//UTF-8代码单元的集合（使用字符串的utf8属性访问）
//UTF-16代码单元的集合（使用字符串的utf16属性访问）
//21位Unicode标量值的集合，相当于字符串的UTF-32编码形式（使用字符串的unicodeScalars属性访问）
let dogString = "Dog‼🐶"
//:UTF-8
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "
//:UTF-16
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "
//:Unicode Scalar
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "

//:作为查询其值属性的替代方案，每个UnicodeScalar值也可以用于构建新的字符串值，例如字符串插值：
for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶

//: [Next](@next)
