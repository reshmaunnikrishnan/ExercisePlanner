//
//  ExercisePlannerService.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 19.05.22.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidURL
    case network(description: String)
}

protocol ExercisePlannerProvider {
    func fetchExerciseList() -> AnyPublisher<ExerciseInfo, Error>
    func fetchExercise(id: String) -> AnyPublisher<Exercise, Error>

}

/// An entity responsible for managing a URLSession
final class ExercisePlannerService {
    private let session: URLSession
    private var cancellable: AnyCancellable?
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension ExercisePlannerService: ExercisePlannerProvider {
    func fetchExerciseList() -> AnyPublisher<ExerciseInfo, Error> {
        let endPoint =  ExercisePlannerEndpoint.get.url(baseUrl: base, path: .list)
        let data: AnyPublisher<ExerciseInfo, Error> = fetchData(with: endPoint)
        return data
    }
    
    func fetchExercise(id: String) -> AnyPublisher<Exercise, Error>   {
        let endPoint =  ExercisePlannerEndpoint.get.url(baseUrl: base, path: .exercise, id: id)
        let data: AnyPublisher<Exercise, Error> = fetchData(with: endPoint)
        return data
    }

    private func fetchData<T>(with components: URLComponents) -> AnyPublisher<T, Error> where T: Decodable {
        
        guard  let url = components.url else {
            let error  = APIError.network(description: "Couldnt create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return session.dataTaskPublisher(for: request).mapError({ error in
            APIError.network(description: error.localizedDescription)
        })
        .map {$0.data}
        .decode(type: T.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}

