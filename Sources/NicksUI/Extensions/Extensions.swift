//
//  File.swift
//  NicksUI
//
//  Created by Niccolò Vianello on 02/07/25.
//

import Foundation
import SwiftUI

extension View {
    func borderedTextField(textPadding: CGFloat = 8, cornerRadius: CGFloat = 8, strokeColor: Color = .black, lineWidth: CGFloat = 1) -> some View {
        self
            .padding(textPadding)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(strokeColor, lineWidth: lineWidth)
            )
    }
}
