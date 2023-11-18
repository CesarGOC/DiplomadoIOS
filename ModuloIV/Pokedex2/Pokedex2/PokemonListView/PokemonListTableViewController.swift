//
//  PokemonListTableViewController.swift
//  Pokedex2
//
//  Created by Diplomado on 17/11/23.
//

import UIKit

class PokemonListTableViewController: UITableViewController {
    let viewModel: PokemonViewListModel = PokemonViewListModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: viewModel.pokemonCellIdentifier)
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }



}

extension PokemonListTableViewController{
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.pokemonCellIdentifier, for: indexPath)
        
        
        let pokemon = viewModel.pokemon(at: indexPath)
        var cellConfiguration = cell.defaultContentConfiguration()
        
        cellConfiguration.text = pokemon.name
        cellConfiguration.secondaryText = pokemon.number
        
        
        cell.contentConfiguration = cellConfiguration
        return cell
    }
}


extension PokemonListTableViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = viewModel.pokemon(at: indexPath)
        let pokemonDetailViewController = PokemonDetailViewController(pokemon: pokemon)
        navigationController?.pushViewController(pokemonDetailViewController, animated: true)
    }
}
