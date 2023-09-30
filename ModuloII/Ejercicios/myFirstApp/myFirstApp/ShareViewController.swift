//
//  ShareViewController.swift
//  myFirstApp
//
//  Created by Diplomado on 29/09/23.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!{ didSet{
        textView.delegate = self
    }}
    
    @IBAction func shareButton(_ sender: UIButton) {
        print(textView.text ?? "")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


}

extension ShareViewController: UITextViewDelegate{
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "" {return true}
        if text.rangeOfCharacter(from: .alphanumerics) == nil && text != " " {
            return false
        }else{
            return(textView.text?.count ?? 0) + text.count - range.length <= 150
        }
    }
}
