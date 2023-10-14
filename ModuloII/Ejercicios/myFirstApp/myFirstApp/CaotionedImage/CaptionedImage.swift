//
//  CaptionedImage.swift
//  myFirstApp
//
//  Created by Diplomado on 13/10/23.
//

import UIKit

class CaptionedImage: UIView {
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var contenView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView(){
        Bundle.main.loadNibNamed("CaptionedImage", owner: self)
        contenView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contenView)
        topAnchor.constraint(equalTo: contenView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contenView.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: contenView.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: contenView.rightAnchor).isActive = true
    }
}
