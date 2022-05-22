//
//  VariationsDetailView.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 21.05.22.
//

import SwiftUI

struct VariationsDetailView: View {
    let inputExercise: Exercise

    var body: some View {
            VStack(spacing: 10) {
                Text(inputExercise.name )
                    .font(.title)
    
                Text(inputExercise.description)
                    .font(.title2)
            }
            .navigationBarTitle("\(inputExercise.name)", displayMode: .inline)
    }
   
}
