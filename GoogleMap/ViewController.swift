//  ViewController.swift
//  GoogleMap
//  Created by Anisha on 26/06/23.
//AIzaSyDiwL7EYrc82oMtwz4XKidob-CIl3AYLBQ

import UIKit
import CoreLocation
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        manager.desiredAccuracy = CLLocationAccuracy()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        GMSServices.provideAPIKey("AIzaSyDiwL7EYrc82oMtwz4XKidob-CIl3AYLBQ")
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
       
        
        print("License: \n\n \(GMSServices.openSourceLicenseInfo())")
  }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        let coordinate = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude , longitude: coordinate.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}
