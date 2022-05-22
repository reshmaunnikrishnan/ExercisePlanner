//
//  ExercisePlannerEndpoint.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 19.05.22.
//

import Foundation


public enum ExercisePlannerUrlPath: String {
    static let urlPath = "/api/v2/exerciseinfo/"
    case list
    case exercise
}

let base = URL(string: "https://wger.de")!
public enum ExercisePlannerEndpoint {
    case get
    
    public func url(baseUrl: URL,
                    path: ExercisePlannerUrlPath = .list, id: String = "nil") -> URLComponents {
        switch self {
        case .get:
            var components = URLComponents()
            components.scheme = baseUrl.scheme
            components.host = baseUrl.host
            components.path = baseUrl.path
            components.path = baseUrl.path + ExercisePlannerUrlPath.urlPath

            if path == .exercise {
                components.path = baseUrl.path + ExercisePlannerUrlPath.urlPath + id
            }
            return components
        }
    }
}

