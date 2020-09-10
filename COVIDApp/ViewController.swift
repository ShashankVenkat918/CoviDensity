//
//  ViewController.swift
//  COVIDApp
//
//  Created by Shashank Venkat on 8/2/20.
//  Copyright © 2020 Shashank Venkat. All rights reserved.
//

import GoogleMobileAds
import UIKit
import MapKit
import Mapbox
import CoreLocation
import Mapbox

class ViewController: UIViewController, MGLMapViewDelegate{
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapView2: MGLMapView!
    
    
    let bombShelterCoord = Place.getBombShelter()
    
    
    
    //AD STUFF
    var bannerView: GADBannerView!
    
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        addAnnotations(places: bombShelterCoord)
        addPolyline(places: bombShelterCoord)
        addPolygon(places: bombShelterCoord)
        
        
        
        
        //Google Ad Banner
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        
        
        
        //Map Stuff
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        var currentLoc: CLLocation!
        var latitude1 = 34.0689
        var longitude1 = -118.4452
        locationManager.requestLocation()
        currentLoc = locationManager.location
        
        if (currentLoc == nil || true)// change to false to set to users location
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
        
        
        
    }
 //Setting Up Ad banner
    func addBannerViewToView(_ bannerView: GADBannerView) {
        
     bannerView.translatesAutoresizingMaskIntoConstraints = false
     view.addSubview(bannerView)
     view.addConstraints(
       [NSLayoutConstraint(item: bannerView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: bottomLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0),
        NSLayoutConstraint(item: bannerView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0)
       ])
    }
    
    func addAnnotations(places: [Place]) {
        mapView?.delegate = self
        mapView?.addAnnotations(places)
        
    }
    
    func addPolyline(places: [Place]) {
        var locations = places.map { $0.coordinate }
        let polyline = MKPolyline(coordinates: &locations, count: locations.count)
        mapView?.addOverlay(polyline)
    }
    
    func addPolygon(places: [Place]) {
        var locations = places.map { $0.coordinate }
        let polygon = MKPolygon(coordinates: &locations, count: locations.count)
        mapView?.addOverlay(polygon)
    }
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
 


extension ViewController: MKMapViewDelegate {
    @nonobjc func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        else {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            annotationView.image = UIImage(named: "place icon")
            return annotationView
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle {
            let renderer = MKCircleRenderer(overlay: overlay)
            renderer.fillColor = UIColor.black.withAlphaComponent(0.5)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 2
            return renderer
        
        } else if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.orange
            renderer.lineWidth = 3
            return renderer
        }
         else if overlay is MKPolygon {
            let renderer = MKPolygonRenderer(polygon: overlay as! MKPolygon)
            renderer.fillColor = UIColor.black.withAlphaComponent(0.5)
            renderer.strokeColor = UIColor.orange
            renderer.lineWidth = 2
            return renderer
        }
        
        return MKOverlayRenderer()
    }
}

