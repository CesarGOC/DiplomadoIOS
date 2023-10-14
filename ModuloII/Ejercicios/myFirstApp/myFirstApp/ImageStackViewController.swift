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
            firstCaptionedImage.setContent(image: "images-2", caption: "images-2")
            secondCaptionedImage.setContent(image: "images-3", caption: "images-3")
            thirdCaptionedImage.setContent(image: "images-4", caption: "images-4")
        }else{
            firstCaptionedImage.setContent(image: "porsche2", caption: "porsche2")
            secondCaptionedImage.setContent(image: "porsche", caption: nil)
            thirdCaptionedImage.setContent(image: "porsche3", caption: "porsche3")
        }
    }

}
