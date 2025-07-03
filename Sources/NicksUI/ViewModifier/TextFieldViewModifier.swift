//
//  File.swift
//  NicksUI
//
//  Created by Niccolò Vianello on 02/07/25.
//

import Foundation
import SwiftUI

struct TextFieldViewModifier: ViewModifier {
    
    var horizontalTextPadding: CGFloat
    var verticalTextPadding: CGFloat
    var cornerRadius: CGFloat
    var strokeColor: Color
    var lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, verticalTextPadding)
            .padding(.horizontal, horizontalTextPadding)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(strokeColor, lineWidth: lineWidth)
            )
    }
}

public extension View {
    func borderedTextField(horizontalTextPadding: CGFloat = 8, verticalTextPadding: CGFloat = 8, cornerRadius: CGFloat = 8, strokeColor: Color = .black, lineWidth: CGFloat = 1) -> some View {
        modifier(TextFieldViewModifier(horizontalTextPadding: horizontalTextPadding, verticalTextPadding: verticalTextPadding, cornerRadius: cornerRadius, strokeColor: strokeColor, lineWidth: lineWidth))
    }
}
