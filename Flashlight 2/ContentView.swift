//
//  ContentView.swift
//  Flashlight 2
//
//  Created by Sergey Lukaschuk on 26.03.2021.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    /// Color for switch
    @State var numberColor = 0
    
    var body: some View {
        ZStack {
            
            // Switch of color
            isBackgroundColor()
            
            VStack {
                Button(action: { toggleFlash() }) {
                    Image(systemName: "flashlight.off.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 200, weight: .ultraLight))
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            guard numberColor != 3 else { return numberColor = 1 }
            numberColor += 1
        }
        .statusBar(hidden: true)
    }
    
    /// The switch that selects background color
    /// - Returns: Returns one of the colors, green, yellow, or red. Returns black by default&
    func isBackgroundColor() -> Color {
        switch numberColor {
        case 1:
            return Color.green
        case 2:
            return Color.yellow
        case 3:
            return Color.red
        default:
            return Color.black
        }
    }
    
    /// Turn on/off the camera flashlight
    func toggleFlash() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { return }
        do {
            try device.lockForConfiguration()
            
            if (device.torchMode == AVCaptureDevice.TorchMode.on) {
                device.torchMode = AVCaptureDevice.TorchMode.off
            } else {
                do {
                    try device.setTorchModeOn(level: 1.0)
                } catch {
                    print(error)
                }
            }
            device.unlockForConfiguration()
        } catch {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





