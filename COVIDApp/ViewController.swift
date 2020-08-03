//
//  ViewController.swift
//  COVIDApp
//
//  Created by Shashank Venkat on 8/2/20.
//  Copyright © 2020 Shashank Venkat. All rights reserved.
//

import UIKit
import MapboxStatic
import MapKit



class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let camera = SnapshotCamera(
            lookingAtCenter: CLLocationCoordinate2D(latitude: 45.52, longitude: -122.681944),
            zoomLevel: 12)
        let options = SnapshotOptions(
            styleURL: URL(string: "mapbox://styles/shaw918/ckddp5s7c4beu1ilgo950t7ye")!,
            camera: camera,
            size: CGSize(width: 200, height: 200))
        let snapshot = Snapshot(
            options: options,
            accessToken: "pk.eyJ1Ijoic2hhdzkxOCIsImEiOiJja2Rkb3FqMXoxOTFoMnhsMHpnZW9lMGU1In0.QWFbOxzLVW2UWdipU62d6A")
        //this is to access the map API.
        imageView.image = snapshot.image
    }


    
}


