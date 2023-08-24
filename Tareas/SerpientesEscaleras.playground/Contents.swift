import UIKit
import Foundation

var dado = 0
let tablero: [Int] = Array(1...24)
var lugar: Int = 0

func tirada(dado: Int){
    lugar += dado
    switch lugar {
        //escaleras
    case 2: print("Escalera.. pasas de lugar 2 a 10 ")
            lugar = 10
    case 5: print("Escalera.. pasas de lugar 5 a 16 ")
            lugar = 16
    case 9: print("Escalera.. pasas de lugar 9 a 11 ")
            lugar = 11
    case 8: print("Escalera.. pasas de lugar 8 a 17 ")
            lugar = 17
        //serpientes
    case 13: print("Serpiente.. pasas de lugar 13 a 3 ")
            lugar = 3
    case 18: print("Escalera.. pasas de lugar 18 a 7 ")
            lugar = 7
    case 21: print("Escalera.. pasas de lugar 21 a 10 ")
            lugar = 10
    case 23: print("Escalera.. pasas de lugar 23 a 15 ")
            lugar = 15
    default:
        break
    }
    if lugar == 24{
        print("*** Ganaste..!! Llegaste a la meta ***")
        print("Se resetea el juego")
        lugar = 0
    }else{
        print("Estas en el lugar \(lugar), sigue lanzando el dado")
    }
}

for i in 1...10{
    dado = Int.random(in: 1...6)
    print("Tirada de dado numero \(i), dio el numero:\(dado)")
    tirada(dado: dado)
}

