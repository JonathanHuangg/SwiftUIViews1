//
//  CircleImage.swift
//  Landmarks
//
//  Created by Jonathan Huang on 5/9/23.
//

import SwiftUI
//You create UIViews for new pages
struct CircleImage: View {
    var image: Image
    var body: some View {
        
        //Oftentimes, custom views will wrap series of modifiers
        image
            .clipShape(Circle()) //clipshape is a cool modifier
            .overlay { //Overlay gives border
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
