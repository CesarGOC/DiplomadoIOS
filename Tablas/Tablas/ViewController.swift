//
//  ViewController.swift
//  Tablas
//
//  Created by Diplomado on 27/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    let model = TableViewModel()

    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
    
    @IBAction func addButton(_ sender: UIButton) {
        model.addRow(text: textField.text ?? "")
        tableView.reloadData()
    }
    

}


extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        model.getSections()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        model.getSectionTitle()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0: model.getCountArray()
        case 1: model.getCountArray()
        default: model.getCountArray()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MyTableViewCell
        
//        if cell == nil{
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//            cell?.backgroundColor = .gray
//            cell?.accessoryType = .disclosureIndicator
//        }
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        //cell?.myTitle.text = model.getTitle(index: indexPath)
        //cell?.detailTextLabel?.text = model.getDescription(index: indexPath)
        
        switch indexPath.section{
        case 0: cell?.backgroundColor = .systemCyan
        case 1: cell?.backgroundColor = .systemPink
        default: cell?.backgroundColor = .systemMint
        }
        cell?.myTitle.text = model.getTitle(index: indexPath)
        cell?.mySubtitle.text = model.getDescription(index: indexPath)
        
        return cell!
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("Llegue aqui")
            model.deleteRow(index: indexPath)
        }
        tableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    //Tamaño de la columna en altura
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0: 80
        case 1: 90
        default: 90
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let selectCell = tableView.cellForRow(at: indexPath)
//        selectCell?.contentView.backgroundColor = .systemPink
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//            selectCell?.contentView.backgroundColor = .clear
//        }
        print(model.getTitle(index: indexPath))
//        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "TableToNextView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
   
}
