//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Jonathan Huang on 5/11/23.
//

import SwiftUI

struct LandmarkRow: View {
    //landmark is of type Landmark - no instance yet
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image //This is found in the JSON file
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name) //Pulls from landmarks[0]
            Spacer()
        }
    }
}


//This preview is only for us to see what the UI element looks like
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group { //Separate previews become rendered
            //changing the array index changes everything associated
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
