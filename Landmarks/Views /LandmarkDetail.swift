//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Jonathan Huang on 5/11/23.
//

import SwiftUI

struct LandmarkDetail: View {
    //When you add a variable, those that use this view needs the variables to be passed in
    //Since you use this landmark struct, you can pass in the attributes from the JSON file
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea() //goes into the notch
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                    Spacer() //Pushes everything to the side
                    Text(landmark.state)
                }
                .font(.subheadline) //This modifier affects the hStack
                .foregroundColor(.secondary)
                
                Divider() //dividing line
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text("Enter descriptive text here")
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
