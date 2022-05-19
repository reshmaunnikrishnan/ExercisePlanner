//
//  ExerciseInfo.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 19.05.22.
//

import Foundation

struct ExerciseInfo : Codable {
    let id: Int
    let uuid: String
    let name: String
    let description: String
    let variations: [Int]
    let images: [Images]
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
