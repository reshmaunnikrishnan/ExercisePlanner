//
//  TestUtils.swift
//  ExercisePlannerTests
//
//  Created by Reshma Unnikrishnan on 23.05.22.
//

import Foundation
@testable import ExercisePlanner

class TestUtils {
    static func loadData(file: String) -> Data? {
        guard let url = Bundle(for: Self.self).url(forResource: file, withExtension: nil), let data = try? Data(contentsOf: url) else { return nil }
        return data
    }

    
    static func mockNetworkClient(file: String) -> ExerciseInfo {
        guard let data =  loadData(file: file) else {               return ExerciseInfo(results: [])
 }
        do {
            let exerciseList: ExerciseInfo  = try JSONDecoder().decode(ExerciseInfo.self, from: data)
            return (exerciseList)
            //all fine with jsonData here
        } catch {
            //handle error
            print(error)
        }
        return ExerciseInfo(results: [])
    }
}
