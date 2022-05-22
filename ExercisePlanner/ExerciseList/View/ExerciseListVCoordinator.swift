//
//  ExerciseListVCoordinator.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 20.05.22.
//

import SwiftUI

struct ExerciseListVCoordinator: View {
    @State private var selectedExercise: Exercise?
    @State private var isPresented = false
        
    var body: some View {
        VStack {
            ExerciseListView(tapOnExerciseAction: { exercise in
                selectedExercise = exercise
            })
            .listStyle(.plain)
            .navigationBarTitle("", displayMode: .inline)            
        }
    }
}


