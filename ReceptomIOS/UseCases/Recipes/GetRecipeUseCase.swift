//
//  GetRecipeUseCase.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 8/1/24.
//
import Foundation
struct GetRecipeUseCase {
    private let recipeRepository: RecipeRepository
    
    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }
    func execute(idRecipe: UUID) async throws -> Recipe {
        try await recipeRepository.getRecipe(idRecipe: idRecipe )
    }
}
