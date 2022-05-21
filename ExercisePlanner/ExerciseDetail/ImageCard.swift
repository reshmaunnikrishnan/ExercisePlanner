//
//  ImageCard.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 21.05.22.
//

import SwiftUI

struct ImageCard: View {
    let images: [Images]
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            ZStack(alignment: .bottom) {
                ForEach(
                let url = images.first?.image
                if let imageURL = URL(string: url ?? "") {
                    if #available(iOS 15.0, *) {
                        
                        AsyncImage( url: imageURL,
                                    placeholder: { Text("Loading ...") },
                                    image: { Image(uiImage: $0).resizable() }
                        )
                        .frame(width: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                    } else {
                        // Fallback on earlier versions
                        RemoteImageView(imageUrl: url ?? "").scaledToFit()
                            .frame(width: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                    }
                }
            }
        }

struct ImageCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageCard()
    }
}
