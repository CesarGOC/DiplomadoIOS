//: [Previous](@previous)

import Foundation

let dado = Int.random(in: 1...6)

let tablero:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
var lugar: Int = 0

func tirada(dado:Int){
    lugar += dado
    switch lugar{
    case 2: lugar = 10
    
    default: break
    }
}
tirada(dado:5)



//: [Next](@next)
