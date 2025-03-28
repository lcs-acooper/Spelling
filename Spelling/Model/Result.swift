//
//  Result.swift
//  Spelling
//
//  Created by  Adam-James  Cooper on 2025-03-28.
//

import Foundation

struct Result: Identifiable {
    
    let id = UUID()
    
    
    let item: Item
    
    
    let guessProvided: String
    
    
    let outcome: Outcome 
    
}
