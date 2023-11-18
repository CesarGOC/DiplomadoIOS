//
//  PokemonDetailViewMiodel.swift
//  Pokedex2
//
//  Created by Diplomado on 17/11/23.
//

import Foundation
import UIKit

protocol PokemonDetailViewModelDelegate: AnyObject{
    func updatePokemonImage(to image: UIImage)
}

class PokemonDetailViewModel{
    private let pokemon: Pokemon
    
    var pokemonName: String{ pokemon.name }
    var pokemonNumber: String{pokemon.number}
    var pokemonHeight: String{pokemon.height}
    var pokemonWeight: String{pokemon.weight}
    var pokemonWeaknesses: [String]{pokemon.weaknesses}
    
    let locationButton: String = "View Pokemon Location"
    
    weak var delegate : PokemonDetailViewModelDelegate?
    
    
    init(pokemon: Pokemon){
        self.pokemon = pokemon
        
        if let pokemonImageURL = URL(string: pokemon.imageURL){
            loadPokemonImage(from: pokemonImageURL)
        }
    }
    
    private func loadPokemonImage(from imageURL: URL){
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: imageURL),
               let pokemonImage = UIImage(data: imageData){
                DispatchQueue.main.async {
                    self?.delegate?.updatePokemonImage(to: pokemonImage)
                }
            }
        }
    }
    
    
}
