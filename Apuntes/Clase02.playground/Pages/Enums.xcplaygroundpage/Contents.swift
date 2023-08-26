//: [Previous](@previous)

import Foundation


//los enums simepre son opcionales
enum Pet: String, CaseIterable {
    case dog = "🐶"
    case cat = "🐱"
    case mouse = "🐭"
    case parakeet = "🦜"
    case turtle = "🐢"
}

let myPet = Pet(rawValue: "🦜")
let myTurrle: Pet = .turtle
let myParakeet = Pet.parakeet


switch myPet{
case .dog: print("🦜")
default: print(myPet?.rawValue)
}


//caseIterable
let allCases = Pet.allCases
for pet in allCases{
    print(pet.rawValue)
}


//Enums con valores asociados
enum ContactMethond{
    case email(String)
    case phone(Int)
    case mail(streetName: String, zipCode: String, streetNumber: Int)
}

var myPreferredContactMethod = ContactMethond.email("ing.cesarguadarrama@gmail.com")

switch myPreferredContactMethod{
case .email(let strEmail): print(strEmail)
case .phone(let intPhone): print(intPhone)
case .mail(streetName: let name, zipCode: let zc, streetNumber: let num): print("Address street \(name) \(num) \(zc)")
//default: break
}



//
//la palabra reservada indirect sirve para hacer recursividad

enum AritmeticExpression{
    case number(Int)
    indirect case addition(AritmeticExpression,AritmeticExpression)
    indirect case multiplication(AritmeticExpression,AritmeticExpression)
    indirect case resta(AritmeticExpression, AritmeticExpression)
    indirect case division(AritmeticExpression,AritmeticExpression)
}

//(5+4)
let five = AritmeticExpression.number(5)
let four = AritmeticExpression.number(4)
let sum = AritmeticExpression.addition(five, four)
let product = AritmeticExpression.multiplication(sum, AritmeticExpression.number(2))

//(5+4)*2
func evaluate(expression: AritmeticExpression)-> Int{
    switch expression{
        
    case .number(let num):
        return num
    case .addition(let leftNumber, let rightNumber):
        return evaluate(expression: leftNumber) + evaluate(expression: rightNumber)
    case .multiplication(let leftNumber, let rightNumber):
        return evaluate(expression: leftNumber) * evaluate(expression: rightNumber)
    case .resta(let leftNumber, let rightNumber):
        return evaluate(expression: leftNumber) - evaluate(expression: rightNumber)
    case .division(let leftNumber, let rightNumber):
        return evaluate(expression: leftNumber) / evaluate(expression: rightNumber)
    }
}

let resultado1 = evaluate(expression: product)
print("Resultado del primer ejercicio: \(resultado1)")


//(6+(4*(8-1)))/2

let resta = AritmeticExpression.resta(AritmeticExpression.number(8), AritmeticExpression.number(1))
let multi = AritmeticExpression.multiplication(AritmeticExpression.number(4), resta)
let plus = AritmeticExpression.addition(AritmeticExpression.number(6), multi)
let div = AritmeticExpression.division(plus, AritmeticExpression.number(2))

let resultado2 = evaluate(expression: div)
print("Resultado del segunso ejercicio: \(resultado2)")
//: [Next](@next)
