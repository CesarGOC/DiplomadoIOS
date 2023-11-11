//
//  CollectionViewController.swift
//  CollectionViews
//
//  Created by Diplomado on 03/11/23.
//

import UIKit

class CollectionViewController: UIViewController {
    var dataArray = ["Alejandro", "Manuel", "Cesar", "Diplomado"]
    let size = UIScreen.main.bounds.width / 2
    
    @IBOutlet var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet var textField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        
        collectionView.addGestureRecognizer(longPressGesture)
            
        
        
    }
    
    @objc private func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer){
        let gestureLocation = gesture.location(in: collectionView)
        switch gesture.state{
        case .began:
            guard let targetIndexPath = collectionView.indexPathForItem(at: gestureLocation) else{return}
            collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gestureLocation)
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    
    
    @IBAction func addButton(_ sender: UIButton) {
        dataArray.append(textField.text ?? "")
        textField.text = ""
        collectionView.reloadData()
    }
    
    

   

}

extension CollectionViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell
        cell?.titleLabel.text = dataArray[indexPath.row]
        
        return cell!
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = dataArray.remove(at: sourceIndexPath.row)
        dataArray.insert(item, at: destinationIndexPath.row)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0{
            return CGSize(width: size, height: size)
        }else{
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        }
    }
}
