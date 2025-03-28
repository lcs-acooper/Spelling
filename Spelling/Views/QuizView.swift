//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: Stored properties
    @State var currentItem = itemsToSpell.randomElement()!
    
    // The user's guess
    @State var userGuess = ""
    
    @State var currentOutcome: Outcome = .undetermined
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            
            HStack {
                TextField("Enter the name of the item", text: $userGuess)
                
                Text(currentOutcome.rawValue)
            }
            
            Button {
                checkGuess()
            } label: {
                Text("Submit")
                }
            
        }
        
    }
    
    // MARK: Functions
    func checkGuess() {
        
        if userGuess == currentItem.word {
            print("Correct")
            currentOutcome = .correct
        } else {
            print("Incorrect")
            currentOutcome = .incorrect
        }
            
        
    }
}

#Preview {
    QuizView()
}
