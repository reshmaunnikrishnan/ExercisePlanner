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
        ZStack(alignment: .topTrailing) {
            
            ZStack(alignment: .bottom) {
                let url = exercise.images.first?.image
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
                
                VStack(alignment: .trailing) {
                    Text(exercise.name)
                        .bold().foregroundColor(.black)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
        }
    }
}

#if DEBUG
struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCard(exercise: ExerciseInfo.mockedData[0])
    }
}
#endif

