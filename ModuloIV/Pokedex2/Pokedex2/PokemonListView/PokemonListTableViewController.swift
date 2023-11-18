//
//  PokemonListTableViewController.swift
//  Pokedex2
//
//  Created by Diplomado on 17/11/23.
//

import UIKit

class PokemonListTableViewController: UITableViewController {
    let viewModel: PokemonViewListModel = PokemonViewListModel()
    let searchBarController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Table View register
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: viewModel.pokemonCellIdentifier)
        //title navigation controller
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.searchController = searchBarController
        
        //Searchbar
        //searchBar.searchResultsController.placeholder = "Buscar"
        searchBarController.searchBar.delegate = self
        searchBarController.hidesNavigationBarDuringPresentation = false
        searchBarController.obscuresBackgroundDuringPresentation = false
        searchBarController.searchBar.placeholder = viewModel.searchBarPlaceholder
        // Agrega la barra de búsqueda a la vista de la tabla
        navigationItem.searchController = searchBarController
        
        viewModel.delegate = self
    }



}


// MARK: - Table view data source
extension PokemonListTableViewController{


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


extension PokemonListTableViewController: UISearchBarDelegate,UISearchControllerDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterPokemon(with: searchText)

    }

   
}


extension PokemonListTableViewController: PokemonListViewModelDelegate{
    func shouldReloadTableData() {
        tableView.reloadData()
    }
}
