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
    
    // An array to store results of users guesses
    @State var history: [Result] = [] // Empty array
    
    // MARK: Computed properties
    var body: some View {
        
        HStack {
            //Left side
            VStack {
                Image(currentItem.imageName)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    TextField("Enter the name of the item", text: $userGuess)
                    
                    Text(currentOutcome.rawValue)
                }
                
                HStack {
                    
                    Button {
                        checkGuess()
                    } label: {
                        Text("Submit")
                    }
                    
                    Button {
                        newWord()
                    } label: {
                        Text("New word")
                    }
                }
            }
            //Right  side
            List(history) { currentResult in
                
                HStack {
                    Image(currentResult.item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    Text(currentResult.guessProvided)
                    
                    Spacer()
                    
                    Text(currentResult.outcome.rawValue)
                }
                
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
    
    func newWord() {
        history.insert(
            Result(
                item: currentItem,
                guessProvided: userGuess,
                outcome: currentOutcome
            ),
            at: 0
        )
        
        //Debug 
        
        // Reset for a new question
        currentItem = itemsToSpell.randomElement()!
        userGuess = ""
        currentOutcome = .undetermined
    }
}

#Preview {
    QuizView()
}
