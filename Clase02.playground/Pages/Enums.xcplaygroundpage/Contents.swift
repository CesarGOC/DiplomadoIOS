//: [Previous](@previous)

import Foundation


//los enums simepre son opcionales
enum Pet: String {
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
//: [Next](@next)
