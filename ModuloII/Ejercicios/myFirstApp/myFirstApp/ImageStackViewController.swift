//
//  ImageStackViewController.swift
//  myFirstApp
//
//  Created by Diplomado on 29/09/23.
//

import UIKit

class ImageStackViewController: UIViewController {
    
    var showCats = false
    @IBOutlet weak var firstImageView: UIImageView!

    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var threeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if showCats {
            firstImageView.image  = UIImage(named: "images-2")
            secondImageView.image = UIImage(named: "images-3")
            threeImageView.image = UIImage(named: "images-4")
        }else{
            firstImageView.image  = UIImage(named: "porsche2")
            secondImageView.image = UIImage(named: "porsche")
            threeImageView.image = UIImage(named: "porsche3")
        }
    }

}
