//
//  ExercisePlannerEndpoint.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 19.05.22.
//

import Foundation


public enum ExercisePlannerUrlPath: String {
    case list = "/api/v2/exerciseinfo/"
}

let base = URL(string: "https://wger.de")!
public enum ExercisePlannerEndpoint {
    case get
    
    public func url(baseUrl: URL,
                    path: ExercisePlannerUrlPath = .list) -> URLComponents {
        switch self {
        case .get:
            var components = URLComponents()
            components.scheme = baseUrl.scheme
            components.host = baseUrl.host
            components.path = baseUrl.path
            components.path = baseUrl.path + path.rawValue
            return components
        }
    }
}

