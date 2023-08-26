//: [Previous](@previous)

//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"
print(greeting)
// Construcciones de proposito general
//paso por valor

struct Car{
    var wheels: Int
    var color: String
    
}
let myCar = Car(wheels: 4, color: "blue")

struct Dog{
    var name: String
    var isAdopted: Bool
}

var dante = Dog(name: "Dante", isAdopted: true)
dante.name = "Juan"

var danteClone = dante
danteClone.isAdopted = false
dante.isAdopted
danteClone.isAdopted

class Carro{
    var wheels: Int
    var color: String
    init(wheels: Int, color: String) {
        self.wheels = wheels
        self.color = color
    }
    
}
let miCarro = Carro(wheels: 4, color: "Black")
miCarro.color = "Blue"
let copyOfMyCar = miCarro
copyOfMyCar.color = "Red"
//: [Next](@next)

class Vehicle {
    var wheels: Int?
    
    init(wheels: Int){
        self.wheels = wheels
    }
}

class Scooter{
    var color: String
    init(color: String = "Blue") {
        self.color = color
    }
}

let myVehicle = Scooter()

//: [Next](@next)
