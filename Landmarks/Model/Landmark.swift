//
//  Landmark.swift
//  Landmarks
//
//  Created by Jonathan Huang on 5/9/23.
//

import Foundation
import SwiftUI
import CoreLocation
//This file is meant to read data from JSON file
//Codable moves data between structure and data file (json file)
//Decodable will allow data to be read
//Identifiable protocol requires data to be unique done using 'id' property
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    
    //imageName reads the name of the image from data
    //Is private because only we care
    private var imageName: String
    //Loads the image from the asset catalog
    var image: Image {
        Image(imageName)
    }
    
    //This is private because you will use private data to make smt public
    private var coordinates: Coordinates
    
    //This interacts with mapkit framework
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    //Look at the JSON file and you'll realize that this is the form that JSON matches
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
