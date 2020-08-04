//
//  ViewController.swift
//  COVIDApp
//
//  Created by Shashank Venkat on 8/2/20.
//  Copyright © 2020 Shashank Venkat. All rights reserved.
//

import UIKit
import MapKit
import MapBox



class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "mapbox://styles/mapbox/streets-v11")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 9, animated: false)
        view.addSubview(mapView)
    }


    
}


