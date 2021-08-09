//
//  ReviewPages.swift
//  learnde
//
//  Created by Max Polinkovsky on 29.05.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import Foundation

struct ReviewPages {
    
   static let shared = ReviewPages()
    
    let data = [
        ReviewModel(image: "stars", reviewTitle: "Die ganze Kunst der Sprache besteht darin, verstanden zu werden.", nameTitle: "Konfuzius"),
        ReviewModel(image: "stars", reviewTitle: "Die Sprache ist die Kleidung der Gedanken.", nameTitle: "Ralph Emerson."),
        ReviewModel(image: "stars", reviewTitle: "Sprachen sind die Archive der Geschichte.", nameTitle: "Arthur Schopenhauer"),
        ReviewModel(image: "stars", reviewTitle: "Das Leben ist zu kurz, um Deutsch zu lernen.", nameTitle: "Oscar Wilde")
    ]
}
