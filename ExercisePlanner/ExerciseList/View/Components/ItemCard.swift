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
                let url = exercise.images.first?.image ?? "https://unsplash.com/photos/J154nEkpzlQ"
                if #available(iOS 15.0, *) {
                    AsyncImage(url: URL(string: url)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.red
                    }
                    .frame(width: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                } else {
                    // Fallback on earlier versions
                    let url = exercise.images.first?.image ?? "https://unsplash.com/photos/J154nEkpzlQ"
                    RemoteImageView(imageUrl: url)
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

