//: [Previous](@previous)

import Foundation

var cellphone: String = "5564748783"
var landline: String? = "000"


print(cellphone)
if let landline = landline{
    print(landline)
}


guard let landline2 = landline else{ fatalError("oops")}

print(landline2)
//: [Next](@next)
