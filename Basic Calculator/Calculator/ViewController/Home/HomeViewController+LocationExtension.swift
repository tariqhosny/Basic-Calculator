//
//  HomeViewController+LocationExtension.swift
//  Basic Calculator
//
//  Created by Tariq on 31/08/2021.
//

import UIKit
import MapKit
import CoreLocation

extension HomeViewController: CLLocationManagerDelegate{
    
    func locationBtn(){
        let locationButton = UIButton()
        locationButton.frame = CGRect(x: 0, y: 0, width: 110, height: 30)
        locationButton.setImage(UIImage(systemName: "location"), for: .normal)
        locationButton.setTitle("Location", for: .normal)
        locationButton.setTitleColor(.black, for: .normal)
        locationButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        locationButton.addTarget(self, action: #selector(getCurrentLocation), for: UIControl.Event.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: locationButton)
    }
    
    @objc func getCurrentLocation(){
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        getAddressFromLatLon(latitude: locValue.latitude, withLongitude: locValue.longitude)
        self.locationManager.stopUpdatingLocation()
    }
    
    func getAddressFromLatLon(latitude: Double, withLongitude longitude: Double) {
        
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(latitude)")!
        let lon: Double = Double("\(longitude)")!
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                if let pm = placemarks {
                    if pm.count > 0 {
                        let pm = placemarks![0]
                        print(pm.subLocality ?? "") // city
                        print(pm.administrativeArea ?? "") //government
                        print(pm.country ?? "")
                        print(pm.locality ?? "")
                        print(pm.subThoroughfare ?? "")
                        print(pm.thoroughfare ?? "")
                        print(pm.subAdministrativeArea ?? "")
                        print(pm.postalCode ?? "")
                        
                        let vc = LocationPopUp(nibName: "LocationPopUp", bundle: nil)
                        vc.country = pm.country ?? ""
                        vc.city = pm.subLocality ?? ""
                        vc.state = pm.administrativeArea ?? ""
                        vc.street = "\(pm.subThoroughfare ?? "") \(pm.thoroughfare ?? "")"
                        vc.zipCode = pm.postalCode ?? ""
                        vc.modalPresentationStyle = .overFullScreen
                        self.present(vc, animated: false)
                    }
                }
            })
        
    }
}
