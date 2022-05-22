//
//  ItemView.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 19.05.22.
//

import SwiftUI

struct ItemCard: View {
    var exercise: Exercise
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                let url = exercise.images.first?.image
                if let imageURL = URL(string: url ?? "") {
                    if #available(iOS 15.0, *) {
                        AsyncImage( url: imageURL,
                                  placeholder: { Text("Loading ...") },
                                image: { Image(uiImage: $0).resizable() }
                        )
                        .padding()
                    } else {
                        // Fallback on earlier versions
                        RemoteImageView(imageUrl: url ?? "")
                            .scaledToFit()
                            .padding()
                    }
                } else {
                    Image("NoImage")
                        .resizable()
                        .scaledToFit()
                }
        
                Text(exercise.name)
                    .bold()
                    .foregroundColor(.black)
                
                Spacer()
            }
        }
        .frame(width: 160, height: 240)
        .border(.gray)
    }
}

#if DEBUG
struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCard(exercise: ExerciseInfo.mockedData[0])
    }
}
#endif

