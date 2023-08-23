//: [Previous](@previous)

import Foundation

for i in 1...5{
    //print(i)
}

let numbers = [1,3,5,7,9]

for number in  numbers{
    //print(number)
}

//de 0 a 20 de 5 en 5
let intervals = stride(from:0, to:20, by:5)
//este formato incluye el 20
//let intervals = stride(from:0, through:20, by:5)

for i in intervals{
    print(i)
}


let pokemon = ["Fire": "Charmander", "Water": "Mudkip", "Grass": "Turtwing", "Electric":"Pikachu"]

for (type,name) in pokemon{
    print("I like \(name) of type \(type)")
}
print("\n\n")
for poke in pokemon{
    print("I like \(poke.value) of type \(poke.key)")
}

let names = ["James", "Dean", "Sam", "Steve", "Chris"]
print("For in loop with counter as index")

var index = 0
for _ in names{
    print(index)
    index += 1
}

print("\nFor -in enumerated")
for (index2, name) in names.enumerated(){
    print(index2, name)
}

print("\nFor -in enumerated for dictionary")
for (index2, pokemon) in pokemon.enumerated(){
    print(index2, pokemon)
}

for (index,(type,name)) in pokemon.enumerated(){
    //print("\(index),\(type),\(name)")
}



for (index,name) in names.enumerated(){
    if index % 2 == 0{
        //print(name)
    }else{
        break // mata el proceso
    }
}



for (index,name) in names.enumerated(){
    if index % 2 == 0{
        continue // continua con el siguiente elemento no llega al print
    }
    print(name)
}

// For con where
for (index,name) in names.enumerated()
    where index % 2 == 0{
        print(name)
}


for poke in pokemon where poke.key == "Fire"{
    print(poke.value)
}
//: [Next](@next)
