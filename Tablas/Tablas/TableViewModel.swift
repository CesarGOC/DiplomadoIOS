//
//  TableViewModel.swift
//  Tablas
//
//  Created by Diplomado on 27/10/23.
//

import Foundation

struct Rows{
    var tittle: String
    var description: String
    
}


class TableViewModel{
    var rowsArray: [Rows] = []
    
    
    init(){
        rowsArray = [
            Rows(tittle: "Pikachu", description: "Electrico"),
            Rows(tittle: "Charmander", description: "Fuego"),
            Rows(tittle: "Gengar", description: "Fantasma")
        ]
    }
    
    func getCountArray()->Int{
        rowsArray.count
    }
    
    func getTitle(index: IndexPath)-> String{
        rowsArray[index.row].tittle
    }
    func getDescription(index: IndexPath)-> String{
        rowsArray[index.row].description
    }
    
    func getSections()->Int{
        2
    }
    
    func getSectionTitle() -> String{
        "Pokemon"
    }
    
    func addRow(text: String){
        rowsArray.append(Rows(tittle: text, description: ""))
    }
    
    func deleteRow(index: IndexPath){
        rowsArray.remove(at: index.row)
    }
}
