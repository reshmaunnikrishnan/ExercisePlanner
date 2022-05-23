//
//  ExercisePlannerTests.swift
//  ExercisePlannerTests
//
//  Created by Reshma Unnikrishnan on 19.05.22.
//

import XCTest
import Combine
@testable import ExercisePlanner

class ExercisePlannerTests: XCTestCase {
    
    private var subject: ExerciseListViewModel!
    private var mockService: MockService!
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        mockService = MockService()
        subject = ExerciseListViewModel(service: mockService)
    }
    
    override func tearDown() {
        mockService = nil
        subject = nil
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testFetchExerciseListSuccess() throws {

        // when
        subject.fetchExerciseList()
        
        // then
        XCTAssertEqual(mockService.getListCallsCount, 1)
        subject.$exerciseList
            .sink { XCTAssert($0.isEmpty) }
            .store(in: &cancellables)
    }
    
    func testFetchExerciseListReturnWithError() throws {
        // given
        mockService.listResponse =  .failure(APIError.invalidResponse)

        // when
        subject.fetchExerciseList()

        // then
        subject.$exerciseList
            .sink { XCTAssert($0.isEmpty) }
            .store(in: &cancellables)
    }
    
    func testGivenServiceCallSucceedsShouldUpdateExcercise() {
        // given
        let response = TestUtils.mockNetworkClient(file: "exerciseInfo.json")
        mockService.listResponse = .success(response)
 
        // when
        subject.fetchExerciseList()
        
       
        // then
        XCTAssertEqual(mockService.getListCallsCount, 1)
        XCTAssertEqual(mockService.listResponse, .success(response))

    }
    
    
}

    
  

