//
//  PokemonLocationViewController.swift
//  Pokedex2
//
//  Created by Diplomado on 18/11/23.
//

import UIKit
import MapKit
import CoreLocation

class PokemonLocationViewController: UIViewController {
    let viewModel: PokemonLocationViewModel = PokemonLocationViewModel()
    
    
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        //mapView.preferredConfiguration = MKHybridMapConfiguration() Siver para hybrido
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
        
    }()
    
    private lazy var dismissButton: UIButton = {
        var dismossButtonConfiguration = UIButton.Configuration.filled()
        dismossButtonConfiguration.buttonSize = .medium
        dismossButtonConfiguration.baseForegroundColor = .secondaryLabel
        dismossButtonConfiguration.baseBackgroundColor = .secondarySystemBackground
        dismossButtonConfiguration.image = UIImage(systemName: "xmark.circle")
        dismossButtonConfiguration.cornerStyle = .capsule
        let dismissButton = UIButton(configuration: dismossButtonConfiguration)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        return dismissButton
    }()
    
    init(){
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupView()
    }
    
    private func setupView(){
        view.addSubview(mapView)
        view.addSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
    
    @objc func dismissModal(){
        dismiss(animated: true)
    }

}

extension PokemonLocationViewController: PokemonLocationViewModelDelegate{
    func updateUserLocation(with coordinate: CLLocationCoordinate2D) {
        let userLocationPin = MKPointAnnotation()
        userLocationPin.coordinate = coordinate
        mapView.addAnnotation(userLocationPin)
        
        let mapRegion = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.region = mapRegion
    }
}


//extension PokemonLocationViewController: CLLocationManagerDelegate{
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let currenLocation = locations.last else{return}
//        
//        let coordinate = currenLocation.coordinate
//        
//        let userLocationPin = MKPointAnnotation()
//        userLocationPin.coordinate = coordinate
//        mapView.addAnnotation(userLocationPin)
//        
//        let mapRegion = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        
//        mapView.region = mapRegion
//    }
//}
