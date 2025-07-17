//
//  TapButton.swift
//  NicksUI
//
//  Created by Niccolò Vianello on 17/07/25.
//

import SwiftUI

struct TapButton: View {
    
    var image: Image?
    var text: String
    var foregroundColor: Color
    var backgroundColor: Color
    var horizontalPadding: CGFloat
    var buttonHeight: CGFloat
    var cornerRadius: CGFloat
    
    var action: (() -> Void)?
    
    init(
        imageSystemName: String,
        text: String = "Sign in with Apple",
        foregroundColor: Color = .white,
        backgroundColor: Color = .black,
        horizontalPadding: CGFloat = 16,
        buttonHeight: CGFloat = 50,
        cornerRadius: CGFloat = 12,
        action: (() -> Void)? = nil
    ) {
        self.image = Image(systemName: imageSystemName)
        self.text = text
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.horizontalPadding = horizontalPadding
        self.buttonHeight = buttonHeight
        self.cornerRadius = cornerRadius
        self.action = action
    }
    
    init(
        uiImage: UIImage,
        text: String = "Sign in with Apple",
        foregroundColor: Color = .white,
        backgroundColor: Color = .black,
        horizontalPadding: CGFloat = 16,
        buttonHeight: CGFloat = 50,
        cornerRadius: CGFloat = 12,
        action: (() -> Void)? = nil
    ) {
        self.image = Image(uiImage: uiImage)
        self.text = text
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.horizontalPadding = horizontalPadding
        self.buttonHeight = buttonHeight
        self.cornerRadius = cornerRadius
        self.action = action
    }
    
    init(
        text: String = "Sign in with Apple",
        foregroundColor: Color = .white,
        backgroundColor: Color = .black,
        horizontalPadding: CGFloat = 16,
        buttonHeight: CGFloat = 50,
        cornerRadius: CGFloat = 12,
        action: (() -> Void)? = nil
    ) {
        self.image = nil
        self.text = text
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.horizontalPadding = horizontalPadding
        self.buttonHeight = buttonHeight
        self.cornerRadius = cornerRadius
        self.action = action
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundStyle(backgroundColor)
            .overlay {
                HStack {
                    if let image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                    }
                    
                    Text(text)
                        .font(.headline)
                }
                .foregroundStyle(foregroundColor)
                
            }
            .makeButton {
                action?()
            }
            .frame(height: buttonHeight)
            .padding(.horizontal, horizontalPadding)
    }
}

#Preview {
    TapButton(imageSystemName: "applelogo")
}
