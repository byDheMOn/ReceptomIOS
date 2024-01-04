//
//  Order.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

struct Order {
    let ingredients: [String]
    let mode: Bool
    let recipeName: String

    init(ingredients: [String], mode: Bool, recipeName: String) {
        self.ingredients = ingredients
        self.mode = mode
        self.recipeName = recipeName
    }
}
