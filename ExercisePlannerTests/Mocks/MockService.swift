//
//  MockService.swift
//  ExercisePlannerTests
//
//  Created by Reshma Unnikrishnan on 23.05.22.
//

import Foundation
import Combine
@testable import ExercisePlanner

class MockService : ExercisePlannerProvider {

    var listResponse: Result<ExerciseInfo, Error> =  .failure(APIError.invalidResponse)
    var response: Result<Exercise, Error> = .failure(APIError.invalidResponse)

    var getCallsCount: Int = 0
    var getListCallsCount = 0



    func fetchExerciseList() -> AnyPublisher<ExerciseInfo, Error> {
        getListCallsCount += 1
        return listResponse.publisher.eraseToAnyPublisher()
    }
    
    func fetchExercise(id: String) -> AnyPublisher<Exercise, Error> {
        getCallsCount += 1
        return response.publisher.eraseToAnyPublisher()
    }
    

}
