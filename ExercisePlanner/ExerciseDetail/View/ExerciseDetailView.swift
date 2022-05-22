//
//  ExerciseDetailView.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 20.05.22.
//

import SwiftUI

struct ExerciseDetailView: View {
    @StateObject var viewModel = ExerciseDetailViewModel()
    let inputExercise: Exercise
    var rows = [GridItem(.fixed(160), spacing: 20)]
    
    var body: some View {
        ScrollView(.vertical) {
            //background color
            
            VStack(spacing: 16) {
                VStack {
                    Text(viewModel.name ?? "")
                        .font(.title)
                }
                
                if viewModel.isDescriptionTextDisplayed {
                    VStack {
                        Text(viewModel.description ?? "")
                            .padding()
                    }
                }
                
                if viewModel.hasImages{
                    Text("Images")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows) {
                            ForEach(viewModel.images ?? [], id: \.id) { image in
                                ImageCard(image: image)
                            }
                        }
                        .background(Color.white)
                        .frame(height: 200)
                    }.padding()
                }
                
                if viewModel.hasVariations{
                    Text("Variations")
                        .font(.headline)
                        .foregroundColor(.primary)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows, alignment: .center) {
                            ForEach(viewModel.variationList ?? []) { exercise in
                                NavigationLink(destination: VariationsDetailView(inputExercise: exercise)) {
                                    ItemCard(exercise: exercise)
                                }
                                .navigationBarTitle("\(exercise.name)", displayMode: .inline)
                            }
                        }
                        .frame(height: 200)
                    }
                    .padding()
                    .background(Color.white)
                    .frame(height: 250)
                }
                
            }
            
            .onAppear {
                viewModel.exercise = inputExercise
                viewModel.fetchExerciseVariations(variations: inputExercise.variations)
            }
            .background(Color("PowderedBlue"))
            .ignoresSafeArea()
            
        }
    }
}
