//
//  ExerciseListViewModel.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 20.05.22.
//

import Foundation
import Combine

protocol ExerciseListViewModelDelegate: AnyObject {
    func showResults() async
}

class ExerciseListViewModel: ObservableObject  {
    
    // MARK: - Properties
    weak var delegate: ExerciseListViewModelDelegate?
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
    

//         private func bind() {
//             $exerciseList.map({ $0?.name }).assign(to: &$name)
//             $exerciseList.map({ $0.description }).assign(to: &$description)
//             $exerciseList.map({ $0.images }).assign(to: &$images)
//             $exerciseList.map({ $0.images.first }).assign(to: &$selectedImage)
//         }
//
         
//
//        @Published var name: String?
//        @Published var description: String?
//        @Published var images: [Images]?
//        @Published var selectedImage: Images?
//
//
 
