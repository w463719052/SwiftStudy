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



//: [Next](@next)

