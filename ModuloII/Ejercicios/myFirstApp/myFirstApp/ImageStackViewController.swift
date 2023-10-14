//
//  ImageStackViewController.swift
//  myFirstApp
//
//  Created by Diplomado on 29/09/23.
//

import UIKit

class ImageStackViewController: UIViewController {
    
    var showCats = false
    @IBOutlet weak var firstCaptionedImage: CaptionedImage!

    @IBOutlet weak var secondCaptionedImage: CaptionedImage!
    
    @IBOutlet weak var thirdCaptionedImage: CaptionedImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if showCats {
            firstCaptionedImage.imageView.image  = UIImage(named: "images-2")
            firstCaptionedImage.captionLabel.text = "images-2"
            secondCaptionedImage.imageView.image = UIImage(named: "images-3")
            //firstCaptionedImage.captionLabel.text = "images-3"
            thirdCaptionedImage.imageView.image = UIImage(named: "images-4")
            //firstCaptionedImage.captionLabel.text = "images-4"
        }else{
            firstCaptionedImage.imageView.image  = UIImage(named: "porsche2")
            secondCaptionedImage.imageView.image = UIImage(named: "porsche")
            thirdCaptionedImage.imageView.image = UIImage(named: "porsche3")
        }
    }

}
