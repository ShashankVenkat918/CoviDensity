//
//  ViewController.swift
//  COVIDApp
//
//  Created by Shashank Venkat on 8/2/20.
//  Copyright © 2020 Shashank Venkat. All rights reserved.
//


import UIKit
import MapKit
import Mapbox
import CoreLocation


class ViewController: UIViewController, MGLMapViewDelegate{
    //@IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!

    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        /*self.locationManager.requestLocation()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()

        }*/
        locationManager.requestWhenInUseAuthorization()
        var currentLoc: CLLocation!
        var latitude1 = 34.0689
        var longitude1 = -118.4452
        //if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        //CLLocationManager.authorizationStatus() == .authorizedAlways) {
        locationManager.requestLocation()
        currentLoc = locationManager.location
        
        if (currentLoc == nil)
        {print("NI")}
        else{
           print(currentLoc.coordinate.latitude)
            print(currentLoc.coordinate.longitude)
            latitude1 = currentLoc.coordinate.latitude
            longitude1 = currentLoc.coordinate.longitude
        }
        //}
        
        
        let initialLocation = CLLocation(latitude: latitude1, longitude: longitude1)
        //comment out next line for cool zoom
        mapView.centerToLocation(initialLocation)
        let uclaCenter = CLLocation(latitude: latitude1, longitude: longitude1)
        let region = MKCoordinateRegion(
          center: uclaCenter.coordinate,
          latitudinalMeters: 1000,
          longitudinalMeters: 1000)
        mapView.setCameraBoundary(
          MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        mapView.showsUserLocation = false
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 5000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        
        // Do any additional setup after loading the view.
       /* let url = URL(string: "mapbox://styles/shaw918/ckddp5s7c4beu1ilgo950t7ye")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: -25, longitude: 133), zoomLevel: 9, animated: false)
        view.addSubview(mapView)*/
        
        
       /*let mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: -25, longitude: 133), zoomLevel: 3, animated: true)
        view.addSubview(mapView)
        mapView.styleURL = MGLStyle.satelliteStyleURL*/
      /*  let annotation = MGLPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 40.77014, longitude: -73.97480)
        annotation.title = "Central Park"
        annotation.subtitle = "The biggest park in New York City!"
        mapView.addAnnotation(annotation)
         */
        // Set the map view's delegate
        //mapView.delegate = self
            //mapView.showsUserLocation = true
            }
/*
        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always allow callouts to popup when annotations are tapped.
        return true
        }
         
        func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        let camera = MGLMapCamera(lookingAtCenter: annotation.coordinate, fromDistance: 4500, pitch: 15, heading: 180)
        mapView.fly(to: camera, withDuration: 4,
        peakAltitude: 3000, completionHandler: nil)
        }
 */
        /*func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
             print("error:: \(error.localizedDescription)")
        }

        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedWhenInUse {
                locationManager.requestLocation()
            }
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

            if locations.first != nil {
                print("location:: (location)")
            }

        }*/
 
    
    }

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
    
}
extension ViewController : CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if locations.first != nil {
            print("location:: (location)")
        }

    }

}
/*
extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // .requestLocation will only pass one location to the locations array
        // hence we can access it by taking the first element of the array
        if let location = locations.first {
            self.latitudeLabel.text = "\(location.coordinate.latitude)"
            self.longitudeLabel.text = "\(location.coordinate.longitude)"
        }
    }
}*/
    /*
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
    print("locations = \(locValue.latitude) \(locValue.longitude)")
}

 func locationManager(_ manager: CLLocationManager,
 didFailWithError error: Error) {}*/

