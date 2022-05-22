//
//  ExerciseDetailViewModel.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 20.05.22.
//

import Foundation
import Combine

class ExerciseDetailViewModel: ObservableObject {
    
    // MARK: - View Properties
    @Published var exercise: Exercise?
    @Published var variationList: [Exercise]? = []
    
    @Published var name: String?
    @Published var description: String?
    @Published var isDescriptionTextDisplayed: Bool = false
    @Published var images: [Images]?
    @Published var hasImages: Bool = false
    @Published var hasVariations: Bool = false
    
    private var disposables = Set<AnyCancellable>()
    private let service: ExercisePlannerProvider = ExercisePlannerService(session: .shared)
    
    init() {
        bind()
    }
    
    private func bind() {
        $exercise.map({ $0?.name }).assign(to: &$name)
        $exercise.map({ $0?.description }).assign(to: &$description)
        $exercise.map({ $0?.description != nil }).assign(to: &$isDescriptionTextDisplayed)
        $exercise.map({ !($0?.variations ?? []).isEmpty }).assign(to: &$hasVariations)
        $exercise.map({ !($0?.images ?? []).isEmpty }).assign(to: &$hasImages)
        $exercise.map({ $0?.images }).assign(to: &$images)
    }
    
    func fetchExerciseVariations(variations: [Int])  {
        let group = DispatchGroup()
        var data: [Exercise] = []
        if variations.isEmpty {
            return
        }
        for i in 0..<variations.count {
            group.enter()
            
            self.service.fetchExercise(id: String(variations[i]))
                .sink { completed in
                    group.leave()
                    print(completed)
                } receiveValue: { response in
                    data.append(response)
                }.store(in: &disposables)
        }
        group.notify(queue: DispatchQueue.main) {
            print("Completed work: check")
            self.variationList = data
        }
    }
    
}
