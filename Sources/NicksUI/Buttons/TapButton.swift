//
//  TapButton.swift
//  NicksUI
//
//  Created by Niccolò Vianello on 17/07/25.
//

import SwiftUI

/// A customizable SwiftUI button view that supports optional images, stylized backgrounds,
/// and configurable layout parameters.
///
/// ## Features:
/// - Optional image (from system name or `UIImage`)
/// - Configurable text label
/// - Customizable foreground and background colors
/// - Adjustable padding, height, and corner radius
/// - Tap action handler via closure
///
/// ## Usage Examples:
///
/// ```swift
/// TapButton(imageSystemName: "applelogo", text: "Sign in with Apple") {
///     // Handle action
/// }
///
/// TapButton(uiImage: UIImage(named: "customIcon")!, text: "Continue with Service") {
///     // Handle action
/// }
///
/// TapButton(text: "Continue") {
///     // Handle action
/// }
/// ```
///
/// ## Parameters:
/// - `imageSystemName`: The name of the SF Symbol to use as the leading icon.
/// - `uiImage`: A `UIImage` to display as the leading icon.
/// - `text`: The button's label text.
/// - `foregroundColor`: The color of the icon and text.
/// - `backgroundColor`: The background color of the button.
/// - `horizontalPadding`: The horizontal padding around the button.
/// - `buttonHeight`: The height of the button.
/// - `cornerRadius`: The corner radius of the button.
/// - `action`: An optional closure that gets executed on tap.
public struct TapButton: View {
    
    var image: Image?
    var text: String
    var foregroundColor: Color
    var backgroundColor: Color
    var horizontalPadding: CGFloat
    var buttonHeight: CGFloat
    var cornerRadius: CGFloat
    
    var action: (() -> Void)?
    
    public init(
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
    
    public init(
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
    
    public init(
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
    
    public var body: some View {
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
