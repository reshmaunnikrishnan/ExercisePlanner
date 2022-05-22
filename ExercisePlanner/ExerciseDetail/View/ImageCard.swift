//
//  ImageCard.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 21.05.22.
//

import SwiftUI

struct ImageCard: View {
    let image: Images
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                if let imageURL = URL(string: image.image) {
                    if #available(iOS 15.0, *) {
                        AsyncImage( url: imageURL,
                                    placeholder: { Text("Loading ...") },
                                    image: { Image(uiImage: $0).resizable() }
                        )
                        .frame(width: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                        .border(.gray)
                        
                    } else {
                        // Fallback on earlier versions
                        RemoteImageView(imageUrl: image.image).scaledToFit()
                            .frame(width: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding()
                            .border(.gray)
                    }
                }
            }
        }
    }
}

struct ImageCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageCard(image: Images.mockedData[0])
    }
}
