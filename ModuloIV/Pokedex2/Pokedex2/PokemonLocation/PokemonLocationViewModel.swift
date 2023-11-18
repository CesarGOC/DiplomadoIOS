//
//  PokemonLocationViewModel.swift
//  Pokedex2
//
//  Created by Diplomado on 18/11/23.
//

import Foundation
import CoreLocation

protocol PokemonLocationViewModelDelegate: AnyObject{
    func updateUserLocation(with coordinate: CLLocationCoordinate2D)
    func shoulShowPermitionAlert()
}

class PokemonLocationViewModel: NSObject{
    private var userLocation: CLLocationCoordinate2D?{
        willSet{
            if let newValue{
                delegate?.updateUserLocation(with: newValue)
            }
        }
    }
    private let locationManager = CLLocationManager()
    
    weak var delegate: PokemonLocationViewModelDelegate?
    
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
}


extension PokemonLocationViewModel: CLLocationManagerDelegate{
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .denied{
            delegate?.shoulShowPermitionAlert()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currenLocation = locations.last else{return}
        
        self.userLocation = currenLocation.coordinate
//        let userLocationPin = MKPointAnnotation()
//        userLocationPin.coordinate = coordinate
//        mapView.addAnnotation(userLocationPin)
//        
//        let mapRegion = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        
//        mapView.region = mapRegion
    }
    
    
    
}
