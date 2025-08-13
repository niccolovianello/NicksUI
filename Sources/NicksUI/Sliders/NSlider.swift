//
//  NSlider.swift
//  NicksUI
//
//  Created by Niccolò Vianello on 13/08/25.
//

import SwiftUI
import UIKit

public struct NSlider: UIViewRepresentable {
    
    final public class Coordinator: NSObject {
        // The class property value is a binding: It’s a reference to the NSlider
        // value, which receives a reference to a @State variable value in ContentView.
        var value: Binding<Float>
        
        // Create the binding when you initialize the Coordinator
        init(value: Binding<Float>) {
            self.value = value
        }
        
        // Create a valueChanged(_:) action
        @MainActor @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Float(sender.value)
        }
    }
    
    var thumbColor: Color = .white
    var minTrackColor: Color?
    var maxTrackColor: Color?
    var minValue: Float = 0.0
    var maxValue: Float = 1.0
    
    @Binding var value: Float
    
    public func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        slider.thumbTintColor = UIColor(thumbColor)
        slider.minimumTrackTintColor = UIColor(minTrackColor ?? .primary)
        slider.maximumTrackTintColor = UIColor(maxTrackColor ?? .secondary)
        slider.value = Float(value)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    public func updateUIView(_ uiView: UISlider, context: Context) {
        // Coordinating data between UIView and SwiftUI view
        uiView.minimumValue = minValue
        uiView.maximumValue = maxValue
        uiView.value = Float(self.value)
    }
    
    public func makeCoordinator() -> NSlider.Coordinator {
        Coordinator(value: $value)
    }
}

struct NSlider_Previews: PreviewProvider {
    static var previews: some View {
        NSlider(
            thumbColor: .white,
            minTrackColor: .blue,
            maxTrackColor: .green,
            value: .constant(0.5)
        )
    }
}
