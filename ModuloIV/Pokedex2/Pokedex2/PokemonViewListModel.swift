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
    init(){
        loadData()
    }
    
    private func loadData(){
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension),
        let pokemonData = try? Data(contentsOf: fileURL) else {
            assertionFailure("Cannot find file: \(fileName)")
            return
        }
        let decoder = JSONDecoder()
        do{
            let pokemonList = try decoder.decode([Pokemon].self, from: pokemonData)
            let _ = pokemonList.count
            
        }catch{
            assertionFailure("\(error.localizedDescription)")
        }
    }
}


//tipos de acceso a datos
//fileprivate
//private
//internal
//public
