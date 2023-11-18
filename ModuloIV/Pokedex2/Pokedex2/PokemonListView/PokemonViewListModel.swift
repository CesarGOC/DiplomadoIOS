//
//  PokemonViewListModel.swift
//  Pokedex2
//
//  Created by Diplomado on 17/11/23.
//

import Foundation

protocol PokemonListViewModelDelegate: AnyObject{
    func shouldReloadTableData()
}


class PokemonViewListModel{
    private let fileName = "pokemon_list"
    private let fileExtension = "json"
    
    private var filtrerPokemonList: [Pokemon] = []
    private var pokemonList: [Pokemon] = []
    
    let pokemonCellIdentifier = "pokemonCell"
    let searchBarPlaceholder = "Search"
    
    let numberOfSections: Int = 1
    var numberOfRows: Int{filtrerPokemonList.count}
    
    weak var delegate: (PokemonListViewModelDelegate)?
    
    let title = "Pokedex"
    
    
    init(){
        loadData()
    }
    
    func pokemon(at indexPath: IndexPath)->Pokemon{
        return filtrerPokemonList[indexPath.row]
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
        self.filtrerPokemonList = pokemonList
    }
    
    
    func filterPokemon(with searchText: String){
        defer{
            delegate?.shouldReloadTableData()
        }
        guard !searchText.isEmpty else {
            filtrerPokemonList = pokemonList
            return
        }
        
        filtrerPokemonList = pokemonList.filter{
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.number.lowercased().contains(searchText.lowercased())
        }
        delegate?.shouldReloadTableData()
    }
}


//tipos de acceso a datos
//fileprivate
//private
//internal
//public
