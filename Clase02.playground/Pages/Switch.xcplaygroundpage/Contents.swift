//: [Previous](@previous)

import Foundation

var animal = "cat"

switch animal{
case "dog": print("🐶")
case "cat":
    print("🐱")
    print("😻")
case "mouse": print("🐭")
case "bird": print("🦜")
default: break
}


// compuestos
switch animal{
case "dog", "cat":
    print("A mi me gustan mucho de esos")
default: print("Meh")
}

//con rangos
let grade = 4
switch grade{
case ...5: print("Failed")
case 6..<9: print("Meh")
case 9: print("9 is great")
case 10: print("WOW")
default: print(":v")
}


let color = (255,255,2)
switch color{
case (let r, let g, 255):
    print("red:\(r), green:\(g), max blue")
    //fallthrough //continua haciendo validaciones
case(_,255,_):
    print("max green")
    //fallthrough
case(255,_,_):
    print("max red")
default: break
}

//switch case with value biding y validaciones where
switch color{
case (let r, let g, 255):
    print("red:\(r), green:\(g), max blue")
    //fallthrough //continua sin hacer comparacion
case let (r,255,b):
    print("red:\(r), max green, blue: \(b)")
    //fallthrough
case let(255,g,b) where g < 255:
    print("max red with green \(g) and blue \(b) ")
default: break
}




//Exercice 2

var coordenada = (4,-5)

switch coordenada{
case let (x,y) where (x >= 0 && x<=5) && (y>=0 && y<5):
    print("Primer cuadrante, coordenadas (\(x),\(y))")
case let (x,y) where (x<=0 && x >= -5) && (y>=0 && y<=5):
    print("Segundo cuadrante, coordenadas (\(x),\(y))")
case let (x,y) where (x<=0 && x >= -5) && (y<=0 && y<=5):
    print("Tercer cuadrante, coordenadas (\(x),\(y))")
case let (x,y) where (x>=0 && x <= 5) && (y<=0 && y >= -5):
    print("Cuarto cuadrante, coordenadas (\(x),\(y))")
case (0,0):
    print("Las coordenadas estan en el origen")
default: print("Fuera de rango")
}


//guard
animal = "dog"
guard animal == "dog" else{ fatalError("Its not a dog")}
print(animal)




//: [Next](@next)
