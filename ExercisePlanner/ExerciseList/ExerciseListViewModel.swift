//
//  ExerciseListViewModel.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 20.05.22.
//

import Foundation
import Combine



class ExerciseListViewModel: ObservableObject  {
    
    // MARK: - Properties
    private let service: ExercisePlannerProvider = ExercisePlannerService(session: .shared)
    
    private var disposables = Set<AnyCancellable>()
    
    // MARK: - View Properties
    @Published private(set) var exerciseList = [Exercise]()
    private(set) var showErrorView: Bool = false
    
    
    func fetchExerciseList()  {
        self.service.fetchExerciseList()
            .receive(on: DispatchQueue.main)
            .sink { completed in
                print(completed)
            } receiveValue: { response in
                self.exerciseList = response.results
            }.store(in: &disposables)
    }
}

