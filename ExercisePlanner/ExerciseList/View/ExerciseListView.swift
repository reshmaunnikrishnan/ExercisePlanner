//
//  ContentView.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 19.05.22.
//

import SwiftUI
import UIKit

struct ExerciseListView: View {
    @StateObject private var viewModel = ExerciseListViewModel(service: ExercisePlannerService())
    let tapOnExerciseAction: (Exercise) -> Void
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.exerciseList, id: \.id) { exercise in
                    NavigationLink(destination: ExerciseDetailView(viewModel: ExerciseDetailViewModel(), inputExercise: exercise)) {
                        ItemCard(exercise: exercise)
                    }.navigationBarTitleDisplayMode(.inline)
                    
                }
            }
            .padding()
        }
        .background(Color("PowderedBlue"))
        .navigationTitle("Exercise Planner")
            .onAppear {
                viewModel.fetchExerciseList()
            }
    }
}

