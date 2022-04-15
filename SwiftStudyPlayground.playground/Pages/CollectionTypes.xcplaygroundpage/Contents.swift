//: [Previous](@previous)

import Foundation

//: #### 集合类型
//:Swift提供了三种主要集合类型，称为数组、集合和字典，用于存储值集合。
//:数组是有序的值集合。
//:集合是唯一值的无序集合。
//:字典是键值关联的无序集合。
//:如果创建一个数组、集合或字典，并将其分配给变量，则创建的集合将是可变的。这意味着可以在集合创建后通过添加、删除或更改集合中的项目来更改（或突变）。如果将数组、集合或字典分配给常量，则该集合是不可变的，其大小和内容无法更改。

//:数组类型速记语法，Swift数组的类型完整写法为Array<Element>，其中Element是允许数组存储的值类型。还可以以速记形式将数组的类型写成[Element]，速记形式是首选。
var someInts: [Int] = [] //创建空数组
print("someInts is of type [Int] with \(someInts.count) items.")
// Prints "someInts is of type [Int] with 0 items."
//:如果上下文已经提供了类型信息，可以创建一个带有空数组文字的空数组
someInts.append(3)
// someInts now contains 1 value of type Int
someInts = []
// someInts is now an empty array, but is still of type [Int]

//:Swift的数组类型还提供了一个初始化器，用于创建特定大小的数组，其所有值都设置为相同的默认值
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]

//:可以通过添加两个具有兼容类型的现有数组用（+）来创建新数组，新数组的类型是从添加的两个数组的类型推断出来的：
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]
var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

//:还可以使用数组文字初始化数组，这是一种将一个或多个值写入数组集合的速记方式
var shoppingList: [String] = ["Eggs", "Milk"]
//:由于Swift的类型推断，如果使用包含相同类型值的数组文字初始化数组，则不必编写数组的类型
var shoppingList1 = ["Eggs", "Milk"]

//:访问和修改数组，可以通过数组的方法和属性或使用下标语法访问和修改数组。
print("The shopping list contains \(shoppingList.count) items.")
// Prints "The shopping list contains 2 items."
//:使用isEmpty属性作为快捷方式来检查计数属性是否等于0：
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}
// Prints "The shopping list isn't empty."

//:您可以通过调用数组的 append(_:) 方法将新项添加到数组的末尾：
shoppingList.append("Flour")
//:或者，用（+=）添加一个或多个兼容项的数组：
shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items

//:使用下标语法从数组中检索值
var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"
//:可以使用下标语法更改给定索引的现有值：
shoppingList[0] = "Six eggs"

//:还可以使用下标语法一次更改值范围，即使替换值集的长度与您要替换的范围不同
shoppingList[4...6] = ["Bananas", "Apples"]
//:要以指定的索引将项目插入数组，请调用数组的insert(_:at:)方法：
shoppingList.insert("Maple Syrup", at: 0)
//:使用remove(at:)方法从数组中删除项目。此方法在指定索引处删除项目并返回已删除的项目
let mapleSyrup = shoppingList.remove(at: 0)
//:如果您想从数组中删除最后一项，请使用removeLast()方法而不是remove(at:)方法，以避免查询数组计数属性
let apples = shoppingList.removeLast()

//:在数组上迭代，可以使用for-in循环迭代数组中的整组值：
for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas

//:如果需要每个项目的整数索引及其值，使用enumerated()方法来迭代数组。对于数组中的每个项，enumerated()方法返回由整数和项组成的元组
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//:Sets集合，集合中存储相同类型的不同值，没有定义的顺序。当项目顺序不重要时，或者当需要确保项目只出现一次时，可以使用集合而不是数组。
//:类型必须是可哈希的才能存储在集合中——也就是说，类型必须提供一种为自己计算哈希值的方法，Swift的所有基本类型（如String、Int、Double和Bool）默认都是可哈希的
//:设置类型语法，Swift集合的类型写为Set<Element>，其中Element是允许该集存储的类型。与数组不同，集合没有等效的速记形式。
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
letters = []
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
//:要检查集合是否包含特定项，请使用包含contains(_:)方法。
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// Prints "It's too funky in here."
//:集合还有.count， insert(_:)，remove(_:)，removeAll()等方法

//:Swift的Set类型没有定义的顺序。要按特定顺序迭代集合的值，请使用sorted()方法，该方法将集合的元素作为使用<运算符排序的数组返回。
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz

//:执行集合操作，可以高效地执行基本集合操作
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
//:使用 intersection(_:) 交集，两个集合都有的值的集合
oddDigits.intersection(evenDigits).sorted()
// []
//:使用 symmetricDifference(_:) 对称差集，去除两个集合都有的剩下的值的集合
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
//:使用  union(_:) 并集，包含两个集合中所有值的新集合。
oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//:使用 subtracting(_:) 差集，值不在指定集合中的新集合。
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]

//:判断集合相等
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
//:使用（==) 来确定两个集合是否包含所有相同的值。
let isEqual = houseAnimals == farmAnimals
// flase
//:使用 isSubset(of:) 方法来确定集合的所有值是否都包含在指定的集合中。
houseAnimals.isSubset(of: farmAnimals)
// true
//:使用 isSuperset(of:) 方法来确定集合是否包含指定集合中的所有值。
farmAnimals.isSuperset(of: houseAnimals)
// true
//:使用 isStrictSubset(of:) 或 isStrictSuperset(of:) 方法来确定集合是子集还是超集，但不等于指定的集合。

//:使用isDisjoint(with:)方法来确定两个集合是否没有共同值。
farmAnimals.isDisjoint(with: cityAnimals)
// true

//:字典，字典在集合中存储相同类型的键和相同类型的值之间的关联，没有定义的顺序。每个值都与一个唯一的键相关联，该键充当字典中该值的标识符
//:字典类型速记语法，Swift字典的类型全文写为Dictionary<Key，Value>，其中Key是可以用作字典键的值类型，Value是字典为这些键存储的值类型。可以以速记形式将字典类型写为[Key:Value]，简写形式是首选

//:创建空字典
var namesOfIntegers: [Int: String] = [:]
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
//:使用字典文字初始化字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//:添加
airports["LHR"] = "London"
//:修改：可以直接根据key修改，也可以用updateValue(_:forKey:)来修改，updateValue(_:forKey:)修改可以返回修改前的值
airports["LHR"] = "London Heathrow"
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
//:检索
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}
// Prints "The name of the airport is Dublin Airport."
//:删除：可以直接用key值设置value为nil，或者，使用removeValue（forKey:）方法从字典中删除键值对。如果存在键值对，此方法将删除并返回删除的值，如果没有值，则返回nil：
airports["APL"] = "Apple International"
// "Apple International" isn't the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."

//: 字典迭代，字典中的每个项目都作为（键、值）元组返回
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// LHR: London Heathrow
// YYZ: Toronto Pearson
//:也可以通过 keys 和 values 来迭代检索 key 和 value
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson
//:如果要使用 keys 和 values 的数组Api，先初始化为新数组
let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]

let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]

//:Swift的词典类型没有定义的顺序。要按特定顺序迭代字典的键或值，请在其键或值属性上使用sorted()方法。

//: [Next](@next)
