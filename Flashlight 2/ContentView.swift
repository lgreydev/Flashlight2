//
//  ContentView.swift
//  Flashlight 2
//
//  Created by Sergey Lukaschuk on 26.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLightOn = true
    
    var body: some View {
        ZStack {
            isLightOn ? Color.white : Color.black
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            isLightOn.toggle()
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
