//
//  ViewController.swift
//  CollectionViews
//
//  Created by Diplomado on 03/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var dataArray = ["Primero", "Segundo","Tercero"]
    var filtrerArray: [String] = []

    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var searchBar: UISearchBar!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filtrerArray = dataArray
        
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    @IBAction func sortButton(_ sender: Any) {
        if tableView.isEditing{
            tableView.isEditing = false
        }else{
            tableView.isEditing = true
        }
    }
    
    


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filtrerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = filtrerArray[indexPath.row]
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        filtrerArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
}
    

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        filtrerArray = []
        
        if searchText == ""{
            filtrerArray = dataArray
        }
        
        for word in dataArray{
            if word.uppercased().contains(searchText.uppercased()){
                filtrerArray.append(word)
            }
        }
        tableView.reloadData()
    }
}

