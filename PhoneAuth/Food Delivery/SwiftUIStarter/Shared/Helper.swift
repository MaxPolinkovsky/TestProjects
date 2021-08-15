//
//  Helper.swift
//  SwiftUIStarter
//
//  Created by Max Polinkovsky on 08.06.21.
//

import Foundation

enum Categories {
    case pizza, burger, pasta, desserts
}

func filterData(foodDataSet: [Food], by category: Categories) -> [Food] {
    var filteredArray = [Food]()
    
    for food in foodDataSet {
        if food.category == category {
            filteredArray.append(food)
        }
    }
    
    return filteredArray
}

func categoryString (for category: Categories) -> String {
    switch category {
    case .pizza:
        return "Pizza"
    case .burger:
        return "Burger"
    case .pasta:
        return "Pasta"
    case .desserts:
        return "Desserts"
        
    }
}
