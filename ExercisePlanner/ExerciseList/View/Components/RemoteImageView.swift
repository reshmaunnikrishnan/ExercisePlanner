//
//  RemoteImageView.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 20.05.22.
//

import SwiftUI
import Combine

// Creates remote image view for devices with ios 14 or lower 
struct RemoteImageView: View {
    var remoteImageURL: RemoteImageURL

    init(imageUrl: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageUrl)
    }

    var body: some View {
        Image(uiImage: UIImage(data: remoteImageURL.data) ?? UIImage())
            .resizable()
            .frame(width: 128, height: 128)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding()
    }
}

class RemoteImageURL {
    @Published var data = Data()
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            DispatchQueue.main.async { self.data = data }
        }.resume()
    }
}

