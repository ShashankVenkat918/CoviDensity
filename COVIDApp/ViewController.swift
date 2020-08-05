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


class ViewController: UIViewController, MGLMapViewDelegate {
    //@IBOutlet weak var imageView: UIImageView!
    @IBOutlet private var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 34.0689, longitude: -118.4452)
        mapView.centerToLocation(initialLocation)
        let uclaCenter = CLLocation(latitude: 34.0689, longitude: -118.4452)
        let region = MKCoordinateRegion(
          center: uclaCenter.coordinate,
          latitudinalMeters: 1000,
          longitudinalMeters: 1000)
        mapView.setCameraBoundary(
          MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        
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

    



