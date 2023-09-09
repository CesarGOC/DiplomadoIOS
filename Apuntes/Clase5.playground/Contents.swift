import Foundation

//tipos de declaración
let someArray:Array<Int> = [Int]()
let someSet:Set<Int> = []

//stack
//last in - first out
//push & pop

//Genericos
//Los genericos sirven para darle diferentes
//tipos de valor a una sola estructura


//struct Stack<Element>{
//    var items = [Element]()
//
//    mutating func push(_ newItem: Element){
//        items.append(newItem)
//    }
//
//
//    mutating func pop() -> Element?{
//        guard !items.isEmpty else { return nil }
//        return items.removeLast()
//    }
//}


var intStack:Stack<Int> = Stack()
intStack.push(1)
intStack.push(2)


//print(intStack.pop())
//print(intStack.pop())
//print(intStack.pop())


var doubleStack: Stack<Double> = Stack()
doubleStack.push(2.0)



//Map

//func myMap<T, U>(_ items: [T], _ transformer: (T) -> (U)) ->[U]{
//    var result = [U]()
//    for item in items{
//        let transformerItem = transformer(item)
//        result.append(transformerItem)
//    }
//    return result
//}


let myStrings = ["one", "two", "three"]
let stringsLengths = myMap(myStrings){ $0.count}
print(stringsLengths)


//Mapping in Stack


struct Stack<Element>: Sequence{
    var items = [Element]()

    mutating func push(_ newItem: Element){
        items.append(newItem)
    }


    mutating func pop() -> Element?{
        guard !items.isEmpty else { return nil }
        return items.removeLast()
    }
    
    mutating func pushAll<S: Sequence>(_ sequence:S) where S.Element == Element{
        for item in sequence{
            self.push(item)
        }
    }

    func myMap<U>(_ transformer: (Element) -> (U)) ->Stack<U>{
        var result = [U]()
        for item in items{
            let transformerItem = transformer(item)
            result.append(transformerItem)
        }
        return Stack<U>(items: result)
    }
    func makeIterator() -> some IteratorProtocol {
        return StackIterator(stack: self)
    }
}


func myMap<T, U>(_ items: [T], _ transformer: (T) -> (U)) ->[U]{
    var result = [U]()
    for item in items{
        let transformerItem = transformer(item)
        result.append(transformerItem)
    }
    return result
}



var intStack2 = Stack<Int>()
intStack2.push(1)
intStack2.push(2)
var doubledStack = intStack.myMap{$0 * 2}

print(intStack2.pop())
print(intStack2.pop())

print(doubledStack.pop())
print(doubledStack.pop())

//Generico con protocolo

func checkIfEqual<T: Equatable>(_ first: T, _ second: T)-> Bool{
    return first == second
}


print(checkIfEqual("one", "two"))
print(checkIfEqual(1, 1))
print(checkIfEqual(1, 2.0))





func ckeckIfDescriptionsMatch<T: CustomStringConvertible, U:CustomStringConvertible>(_ first: T, _ second: U) -> Bool{
    return first.description == second.description
}


print(Int(1))
print( UInt(1))
print(ckeckIfDescriptionsMatch(Int(1), UInt(1)))
print( ckeckIfDescriptionsMatch(Int(1), 1.0))




//protocolo con genericos

//protocol IteratorProtocol{
//    associatedtype Element
//    mutating func next() -> Element?
//}

struct StackIterator<T>: IteratorProtocol{
    typealias Element = T
    var stack: Stack<T>
    mutating func next() -> T? {
        return stack.pop()
    }
}

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

let mySet: Array<Int> = [1,5,3,5,7,4]
myStack.pushAll([1,5,3,5,7,4])
myStack.pushAll(mySet)

var myStackIterator = StackIterator(stack: myStack)

while let value = myStackIterator.next(){
    print(value)
}


//protocol Sequence{
//    associatedtype Iterator: IteratorProtocol
//    associatedtype Element where Element == Iterator.Element
//
//    func makeIterator() -> Iterator
//}


for value in myStack{
    print("for in loop: got \(value)")
}






