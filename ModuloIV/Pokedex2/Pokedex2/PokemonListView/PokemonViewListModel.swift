//
//  PokemonViewListModel.swift
//  Pokedex2
//
//  Created by Diplomado on 17/11/23.
//

import Foundation


class PokemonViewListModel{
    private let fileName = "pokemon_list"
    private let fileExtension = "json"
    
    
    private var pokemonList: [Pokemon] = []
    
    let pokemonCellIdentifier = "pokemonCell"
    
    let numberOfSections: Int = 1
    var numberOfRows: Int{pokemonList.count}
    
    let title = "Pokedex"
    
    
    init(){
        loadData()
    }
    
    func pokemon(at indexPath: IndexPath)->Pokemon{
        return pokemonList[indexPath.row]
    }
    
    private func loadData(){
        guard let fileURL = Bundle.main.url(forResource: fileName, 
                                            withExtension: fileExtension),
        let pokemonData = try? Data(contentsOf: fileURL),
        let pokemonList = try? JSONDecoder().decode([Pokemon].self, from: pokemonData)
        
        else {
            assertionFailure("Cannot find file: \(fileName)")
            return
        }
        self.pokemonList = pokemonList
    }
}


//tipos de acceso a datos
//fileprivate
//private
//internal
//public
