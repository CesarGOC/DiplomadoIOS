import UIKit


//Structuras

class Car{
    var wheels: Int
    var color : String
    
    init(wheels: Int, color: String){
        self.wheels = wheels
        self.color = color
    }
}
let myCar = Car(wheels: 4, color: "Black")
myCar.color = "Blue"
let copyOfMyCar = myCar
copyOfMyCar.color = "Red"

myCar.color


struct Dog{
    var name: String
    var isAdopted: Bool
}

var duke = Dog(name: "Duke", isAdopted: true)

duke.name = "Jake"


var cloneDuke = duke
cloneDuke.isAdopted = false
print(duke.isAdopted)
print(cloneDuke.isAdopted)





class Vehicle{
    var wheels: Int?
    init(wheels: Int){
        self.wheels = wheels
    }
}

class Scooter{
    var color: String
    
    init(color: String = "Blue"){
        //wheels = 2
        self.color = color
    }
}


let myVehicle = Scooter()
