//
//  RecipeMapper.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 8/1/24.
//

import Foundation
struct RecipeMapper {
    static func toLocal(type: Recipe ) -> CacheRecipe {
        return CacheRecipe(
            name: type.name,
            ingredients: type.ingredients,
            instructions: type.instructions,
            serving: type.serving
        )
    }
    static func fromLocal(type: CacheRecipe) -> Recipe {
        //let idAsInt: Int? = type.id?.uuidString.hash
        return Recipe(
            id: type.id,
            name: type.name,
            ingredients: type.ingredients,
            instructions: type.instructions,
            serving: type.serving
        )
    }
}
