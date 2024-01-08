//
//  AddRecipeUseCase.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 8/1/24.
//

struct AddRecipeUseCase {
    private let recipeRepository: RecipeRepository
    
    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }
    func execute(recipe: Recipe) async throws {
        try await recipeRepository.addRecipe(recipe: recipe)
    }
}

