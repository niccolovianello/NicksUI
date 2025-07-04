//
//  ImageLoaderView.swift
//  NicksUI
//
//  Created by Niccolò Vianello on 04/07/25.
//

import SwiftUI

public struct ImageLoaderView: View {
    
    var urlString: String
    var resizingMode: ContentMode
    var cornerRadius: CGFloat
    
    public init(urlString: String, resizingMode: ContentMode = .fill, cornerRadius: CGFloat = 0) {
        self.urlString = urlString
        self.resizingMode = resizingMode
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        Rectangle()
            .opacity(0.0)
            .overlay {
                AsyncImage(url: URL(string: urlString)) { phase in
                    switch phase {
                    case .empty:
                        EmptyView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: resizingMode)
                            .allowsHitTesting(false)
                            .cornerRadius(cornerRadius)
                    case .failure:
                        EmptyView()
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView(urlString: "https://picsum.photos/300/300")
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
