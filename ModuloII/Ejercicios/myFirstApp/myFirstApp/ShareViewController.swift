//
//  ShareViewController.swift
//  myFirstApp
//
//  Created by Diplomado on 29/09/23.
//

import UIKit

class ShareViewController: UIViewController {


    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        return textView
    }()
    
    private lazy var shareButton: UIButton = {
        let action = UIAction(title: "Share") { [weak self] _ in self?.shareButtonTap()
        }
        let button = UIButton(primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
       //previo a ios 14
        //let button = UIButton()
        //button.addTarget(self, action: #selector(shareButtonTap), for: .touchUpInside)
        //button.setTitle("Share", for: .normal)
        return button
    }()
    
    @objc func shareButtonTap(){
        print(textView.text ?? "")
    }
    
    
    
    private func setElements(){
        view.addSubview(textView)
        view.addSubview(shareButton)
    
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            textView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            textView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            
            shareButton.topAnchor.constraint(equalTo: textView.bottomAnchor,constant: 20),
            shareButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3),
            shareButton.heightAnchor.constraint(equalToConstant: 50),
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setElements()
        
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
