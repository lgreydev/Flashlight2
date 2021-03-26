//
//  ContentView.swift
//  Flashlight 2
//
//  Created by Sergey Lukaschuk on 26.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "flashlight.off.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 200, weight: .ultraLight))
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
