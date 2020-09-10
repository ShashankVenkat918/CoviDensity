//
//  UCLALocation.swift
//  MapKit Starter
//
//  Created by Shashank Venkat on 09/04/2020.
//
//
/*
import MapKit

@objc class BombShelter: NSObject {    
    static func getBombShelter() -> [Place] {
        guard let path = Bundle.main.path(forResource: "BombShelter", ofType: "plist"), let array = NSArray(contentsOfFile: path) else { return [] }
        
        var places = [Place]()
        
        for item in array {
            let dictionary = item as? [String : Any]
            let title = dictionary?["title"] as? String
            let subtitle = dictionary?["description"] as? String
            let latitude = dictionary?["latitude"] as? Double ?? 0, longitude = dictionary?["longitude"] as? Double ?? 0
            
            let place = Place(title: title, subtitle: subtitle, coordinate: CLLocationCoordinate2DMake(latitude, longitude))
            places.append(place)
        }
        
        return places as [Place]
    }
}*/


