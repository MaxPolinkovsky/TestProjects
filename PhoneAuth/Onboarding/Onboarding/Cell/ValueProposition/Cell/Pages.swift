//
//  Pages.swift
//  learnde
//
//  Created by Max Polinkovsky on 02.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import Foundation

struct Pages {
    
    static let shared = Pages()
    
    let pages = [
        Page(imageName: "icnEasy", pageName: "", pageText: "Learn german words \nin 10 minutes a day!".localized(), imageBackground: "imgHappypeople"),
        Page(imageName: "bookShelf", pageName: "Successfully passing exams A1-B2".localized(), pageText: "The course contains 1200+ necessary words for passing the exam A1-B2".localized(), imageBackground: ""),
        Page(imageName: "book", pageName: "Create your own dictionary!".localized(), pageText: "You have the option to create your own dictionary!".localized(), imageBackground: ""),
        Page(imageName: "happy", pageName: "The topics are close to educational!".localized(), pageText: "After completing the course\nwill be able to pass the exam".localized(), imageBackground: ""),
    ]
}
