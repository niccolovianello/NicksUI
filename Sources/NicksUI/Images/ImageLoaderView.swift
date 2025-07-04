//
//  ImageLoaderView.swift
//  NicksUI
//
//  Created by Niccolò Vianello on 04/07/25.
//

import SwiftUI

struct ImageLoaderView: View {
    
    var urlString: String
    var resizingMode = ContentMode.fill
    var cornerRadius: CGFloat = 0

    var body: some View {
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
