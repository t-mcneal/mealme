//
//  Recipe.swift
//  MealMe
//
//  Created by Kai McNeal on 3/17/22.
//

import Foundation

class Recipe {
    enum Category: String {
        case breakfast
        case lunch
        case dinner
        case dessert
    }
    
    var name: String
    var category: Category
    var ingredients: String
    var steps: String
    var isFavorite: Bool
    
    init(name: String, category: Category, ingredients: String, steps: String, isFavorite: Bool) {
        self.name = name
        self.category = category
        self.ingredients = ingredients
        self.steps = steps
        self.isFavorite = isFavorite
    }
}
