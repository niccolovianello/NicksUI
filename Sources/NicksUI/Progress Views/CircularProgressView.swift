//
//  CircularProgressView.swift
//  Pomodoro
//
//  Created by Niccolò Vianello on 19/12/25.
//

import SwiftUI

public struct CircularProgressView: View {
    
    let progress: Double
    
    var lineWidth: CGFloat = 12
    var lineCap: CGLineCap = .round
    var progressColor: Color = .black
    var progressOpacity: Double = 1
    var backgroundColor: Color = .black
    var backgroundOpacity: Double = 0.2
    var animation: Animation = .linear(duration: 1)
    var rotationEffect: Angle = .degrees(-90)
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(backgroundOpacity)
                .foregroundStyle(backgroundColor)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: lineCap,
                    )
                )
                .foregroundStyle(progressColor)
                .opacity(progressOpacity)
                .rotationEffect(rotationEffect)
                .animation(animation, value: progress)
        }
    }
}

#Preview {
    CircularProgressView(progress: 0.5)
        .padding()
}
