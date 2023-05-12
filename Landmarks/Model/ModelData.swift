//
//  ModelData.swift
//  Landmarks
//
//  Created by Jonathan Huang on 5/9/23.
//

import Foundation

//landmarks is an array of landmarks
//load turns content into an array 
var landmarks: [Landmark] = load("landmarkData.json")

//T: Decodable specifies that the function can work with any type T
//The underscore before filename is used in order to say that you can just call the filename
//ex: load("hello.json") vs load(fileName: "hello.json")
//load takes in an object of type T that conforms to decodable with a string filename and returns a type T
func load<T: Decodable>(_ filename: String) -> T {
    //'Let' declares a constant
    let data: Data //data is uninitilized but is declared as Data which is a sequence of bytes
    
    //guard keyword checks for condition, if false, code inside executes
    //A bundle is a directory, bundle.main is the current directory
    //file is loaded with the given filename from the bundle/directory
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        //This line loads the CONTENTS of the data into the data variable
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        //create a JSONDecoder instance
        let decoder = JSONDecoder()
        //Use the decoder to decode the data
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
    //This will create an instance of the Landmark struct as designed previously
}
