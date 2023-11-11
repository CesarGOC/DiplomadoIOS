import UIKit

let defaults = UserDefaults.standard


//guardar dato
defaults.set(5, forKey: "Entero")
defaults.setValue("5", forKey: "String")

//recuperar el valor
defaults.object(forKey: "Entero")
defaults.integer(forKey: "Entero")


struct myStruct: Codable{
    var variableUno: String
    var variableDos: Int
    
    
}


let myArray = [
    myStruct(variableUno: "Uno", variableDos: 1),
    myStruct(variableUno: "Dos", variableDos: 2)
]


if let encodeData = try? JSONEncoder().encode(myArray){
    //guardar el json codificado en userdefaults con una clava especifica
    defaults.set(encodeData,forKey: "myArrayKey")
}


if let saveData = defaults.data(forKey: "myArrayKey"), let decodeArray = try? JSONDecoder().decode([myStruct].self, from: saveData){
    print(decodeArray[0])
}
