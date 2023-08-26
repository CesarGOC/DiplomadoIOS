//: [Previous](@previous)

import Foundation

//func myAwsomePrintingFunction(){
//    print("Hallo World")
//}
//
//myAwsomePrintingFunction()


func myAwsomePrintingFunction(name: String){
    print("Hallo \(name), Welcome to the class..!!")
}
myAwsomePrintingFunction(name: "César")


func add(lhs: Int, rhs: Int){
    print("\(lhs) + \(rhs) = \(lhs + rhs)" )
}
add(lhs: 2, rhs: 2)


//Nombre de parametro distinto
func printWelcomeMessage(to name: String, course: String = "Diplomado IOS" ){
    print("Hello \(name), welcome to \(course)")
}
printWelcomeMessage(to: "César", course: "Diplomado Android")
printWelcomeMessage(to: "César")


var error = "The process failed: "
func appendErrorCode(_ code:Int, toErrorString errorString: inout String){
    if code == 400{
        errorString += "bad request"
    }
}
print(error)
appendErrorCode(400, toErrorString: &error)
print(error)


func welcomeMessage(to name: String) -> String{
    return "Welcome \(name)"
}


print(welcomeMessage(to: "Cesar"))



//Una funcion dentro de otra

func areaOfTrinaguleWith(base: Double, height:Double)-> Double{
    let rectangle = base * height
    
    func divide() -> Double{
        let someMessage = ""
        return rectangle/2
    }
    return divide()
}

print(areaOfTrinaguleWith(base: 3, height: 5))


func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens:[Int], odd: [Int]){
    var evens = [Int]()
    var odds = [Int]()
    
    for number in numbers{
        if number % 2 == 0{
            evens.append(number)
        }else{
            odds.append(number)
        }
    }
    return (evens: evens, odd: odds)
}

let aBuchOfNumbers = [23,45,10,3,2,45,79,8,32,78,9]
let sortedEvenAndOddNumbers = sortedEvenOddNumbers(aBuchOfNumbers)
print("The even numbers are: \(sortedEvenAndOddNumbers.evens)")
print("The odd numbers are: \(sortedEvenAndOddNumbers.odd)")

//: [Next](@next)
