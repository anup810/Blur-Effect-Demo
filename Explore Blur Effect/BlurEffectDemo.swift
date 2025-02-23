//
//  ContentView.swift
//  Explore Blur Effect
//
//  Created by Anup Saud on 2025-02-22.
//

import SwiftUI

struct BlurEffectDemo: View {
    @State private var mainBlendRadius: Double = 10.0
    @State private var redBlendRadius: Double = 10.0
    @State private var blueBlendRadius: Double = 10.0
    
    let blendModes : [BlendMode] = [
        .plusLighter, .softLight, .normal
    ]
    @State private var blendModeIndex = 0
    var blendMode: BlendMode{
        blendModes[blendModeIndex]
    }
    var body: some View {
        VStack {
            
            ZStack {
                LinearGradient(
                    colors: [.purple, .blue, .green, .orange],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .blur(radius: mainBlendRadius)
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 30))
                    .overlay {
                        Text("Color Blur Effects")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                // Red Circle
                BlendedCircleView(
                    color: .red,
                    circleRadius: 200,
                    offsetX: -100,
                    offsetY: 100,
                    blurRadius: redBlendRadius,
                    blendMode: blendMode
                )
                // Blue Circle
                BlendedCircleView(
                    color: .blue,
                    circleRadius: 150,
                    offsetX: 120,
                    offsetY: -80,
                    blurRadius: blueBlendRadius,
                    blendMode: blendMode
                )
                
            }
            //Sliders
            VStack{
                SliderTextView(
                    value: $mainBlendRadius,
                    min: 0,
                    max: 30,
                    text: "main blur radius",
                    color: .purple
                )
                SliderTextView(
                    value: $redBlendRadius,
                    min: 0,
                    max: 30,
                    text: "red blur radius",
                    color: .red
                )
                SliderTextView(
                    value: $blueBlendRadius,
                    min: 0,
                    max: 30,
                    text: "main blur radius",
                    color: .blue
                )
                
            }
        }
        .padding()
        .onTapGesture {
            blendModeIndex = (blendModeIndex + 1) % blendModes.count
        }
        
    }
}

#Preview {
    BlurEffectDemo()
}
