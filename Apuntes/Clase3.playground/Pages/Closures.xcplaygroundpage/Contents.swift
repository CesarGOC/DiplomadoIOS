//: [Previous](@previous)

import Foundation

//closures

let volunteerCounts = [1,3,40,45,46,2,23,40]

func isAscending( i: Int, _ j: Int) -> Bool{
    return i<j
}

//let volunteerSorted = volunteerCounts.sorted(by: {(i: Int, j:Int) -> Bool in return i<j})
//let volunteerSorted = volunteerCounts.sorted(by: {(i, j) -> Bool in i<j})
//let volunteerSorted = volunteerCounts.sorted(by: {$0<$1})
let volunteerSorted = volunteerCounts.sorted() {$0>$1}



func doAwsomeWork(on input: String,
                  using transformer: () -> Void,
                  then completetion: () -> Void){
// Here woukd go the logic to do the awesome work
}

doAwsomeWork(on: "Diplomado"){
    //Here goes the tranformer
}then:{
    //Here goes the completion
}


print(volunteerSorted)

let volunteerAverages = [10, 6.5,2.5,12.12,18.815]

//Agregar Closures y tambien retornos por default
func format(numbers: [Double], using formatter: (Double) -> String = {"\($0)"}) -> [String]{
    var result = [String]()
    
    for number in numbers{
        let tranformedNumber = formatter(number)
        result.append(tranformedNumber)
    }
    return result
}

func rounder(_ number:Double) -> String{
    let roundedNumber = Int(number)
    return "\(roundedNumber)"
}


let formatterAverageVoluntteers = format(numbers: volunteerAverages, using: rounder)

print(volunteerAverages)
print(formatterAverageVoluntteers)


func addDescription(_ number: Double) -> String{
    return "volunteer average:\(number)"
}

let averageVoluntteersDescription = format(numbers: volunteerAverages, using: addDescription)
print(averageVoluntteersDescription)


//Este es por default
let defaultVolunteerFormat = format(numbers: volunteerAverages)
print(defaultVolunteerFormat)



// funcion map regresa un arreglo del mismo tamaño
let roundedVolunteers = volunteerAverages.map{ number in
    let roundednumber = Int(number)
    return roundednumber
}

print(roundedVolunteers)


//funcion filter regresa un arreglo igual, menor o mayor
let passingVolunteers = roundedVolunteers.filter{number in
    return number>=10 }

print(passingVolunteers)


//Funcion reduce, retorna un unico valor

let totalVolunteers = passingVolunteers.reduce(0){
    partialResult, number in
    return partialResult + number
}

print(totalVolunteers)


//: [Next](@next)
