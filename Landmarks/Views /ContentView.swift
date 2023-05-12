//
//  ContentView.swift
//  Landmarks
//
//  Created by Jonathan Huang on 5/9/23.
//

import SwiftUI

//Conforms to view protocol
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

//Describes preview for that view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
