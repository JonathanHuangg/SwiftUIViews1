//
//  MapView.swift
//  Landmarks
//
//  Created by Jonathan Huang on 5/9/23.
//

import SwiftUI
import MapKit
//For maps, click on live preview
struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    //@State establishes source of truth for data
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    
    var body: some View {
        //By have a $ before a state variable, you are passing a "binding"
        //This binding creates a reference in real time so the map updates
        //when the user moves around on the map
        Map(coordinateRegion: $region)
            //Called when map appears (used for updating the view)
            .onAppear() {
                setRegion(coordinate)
            }
    }
    //CLLLocationCoordinate2D is a struct that represents geological coordinate (it's a single point)
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        //MKCoordinateRegion is a struct that represents a rectangular geographic region (it's the range from a single pont)
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -1116.166_868))
    }
}
