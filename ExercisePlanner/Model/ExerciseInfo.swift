//
//  ExerciseInfo.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 19.05.22.
//

import Foundation

public struct ExerciseInfo : Codable {
    let results: [Exercise]
}

public struct Exercise : Codable , Identifiable {
    public let id: Int
    let uuid: String
    let name: String
    let description: String
    let images: [Images]
    let variations: [Int]

}

struct Images: Codable {
    let id: Int
    let uuid: String
    let image: String
    let isMain: Bool
}

extension Images {
    enum CodingKeys: String, CodingKey {
        case id, uuid, image
        case isMain = "is_main"
    }
}

#if DEBUG
extension ExerciseInfo {
    static let mockedData: [Exercise] = [
        Exercise(id: 345, uuid: "c788d643-150a-4ac7-97ef-84643c6419bf", name: "Handed Kettlebell Swing", description: "Two Handed Russian Style Kettlebell swing", images: [], variations: []),
        Exercise(id: 5, uuid: "5675ae61-6597-4806-ae5c-2dda5a5ac03c", name: "Ausfallschritte im Gehen", description: "", images: [Images(id: 121, uuid: "", image:     "https://wger.de/media/exercise-images/113/Walking-lunges-1.png", isMain: false)], variations: []),
        Exercise(id: 55, uuid: "c788d643-150a-4ac7-9ff7ef-84643c6419bf", name: "Handed Kettlebell Lunge", description: "Two Handed Russian Style Kettlebell swing", images: [], variations: [])
            
        ]
}

extension Images {
    static let mockedData: [Images] =
         [Images(id: 121, uuid: "", image:     "https://wger.de/media/exercise-images/113/Walking-lunges-1.png", isMain: false),
        Images(id: 1, uuid: "e35gfd", image: " ", isMain: true)]
}
#endif
