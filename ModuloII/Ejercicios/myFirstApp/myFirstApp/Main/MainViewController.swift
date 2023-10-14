//
//  ViewController.swift
//  myFirstApp
//
//  Created by César Alejandro Guadarrama Ortega on 22/09/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var titleTextField: UITextField! {
        didSet{
            titleTextField.delegate = self
        }
    }
    
    @IBOutlet weak var photoTypeSwitch: UISwitch!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func nextButtonTapped(_ sender: UIButton){
        print(photoTypeSwitch.isOn)
        if sender.tag == 0{
            //performSegue(withIdentifier: "SegueMainToInfo", sender: nil)
            segueToInfo()
            
        }else{
            //performSegue(withIdentifier: "SegueFromMainToPhotos", sender: nil)
            segueToPhotos()
        }
    }
    
    func segueToInfo(){
        let infoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoViewController")
        infoViewController.title = "Info"
        navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    func segueToPhotos(){
        guard let photosViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageStackViewController") as? ImageStackViewController else{return}
        photosViewController.showCats = photoTypeSwitch.isOn
        if switch2.isOn{
            photosViewController.title = titleTextField.text
        }
        navigationController?.pushViewController(photosViewController, animated: true)
    }
    
    
    @IBAction func titleTexfieldEditingChanged(_ sender: UITextField) {
        titleLabel.text = sender.text
    }
    
    @IBAction func labelSwitch(_ sender: UISwitch) {
        if sender.isOn{
            titleLabel.text = "Label"
            titleLabel.textColor = .black
            titleTextField.isEnabled = true
        }else{
            titleLabel.text = "Custom title not selected"
            titleLabel.textColor = .systemRed
            titleTextField.isEnabled = false
        }
    }
    
    
    
    
    @IBAction func phothoTypeSwitchValueChanged(_ sender: UISwitch) {
        
        sender.isOn ? nextButton.setTitle("Cats", for: .normal) : nextButton.setTitle("Car", for: .normal)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("1")
        photoTypeSwitch.onTintColor = .systemRed
        
    }
    
    override func
    viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("2")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("3")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //print("4")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //print("5")
    }


}


extension MainViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {return true}
        if string.rangeOfCharacter(from: .alphanumerics) == nil && string != " " {
            return false
        }else{
            return(textField.text?.count ?? 0) + string.count - range.length <= 10
        }
    }
}

