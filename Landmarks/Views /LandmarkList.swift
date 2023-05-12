//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jonathan Huang on 5/11/23.
//

import SwiftUI

//Combines the Landmark Rows into lists
struct LandmarkList: View {
    var body: some View {
        //container that provides 'navigation interface'
        //I feel like this is something where you just copy syntax
        NavigationView {
        //lists work with 'identifiable' data
        //1) pass along data (hard coding it in)
        //2) make data conform to identifiable protocol
        //id pulls from landmarks array (each landmark struct has a .id property)
        //The \ in \.id is used to create a keypath to get struct property (outdated)
        //You don't need id: \.id if you have conformance to identifiable protocol
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //ForEach can be used to create a dynamic list
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
        LandmarkList()
            //I don't think this features works lol but you can change this in the tab anyway
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
        }
    }
}
