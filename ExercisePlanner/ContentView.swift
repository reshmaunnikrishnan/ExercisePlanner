//
//  ContentView.swift
//  ExercisePlanner
//
//  Created by Reshma Unnikrishnan on 20.05.22.
//

import SwiftUI
import UIKit


struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ExerciseListVCoordinator()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
