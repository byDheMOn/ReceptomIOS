//
//  RecipeLocalService.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 8/1/24.
//
import Foundation
protocol RecipeLocalService {
    func getAllRecipes() async throws -> [Recipe]
    func getRecipe(idRecipe: UUID) async throws -> Recipe
    func addRecipe(recipe: Recipe) async throws
    func deleteRecipe(recipe: Recipe) async throws

}
