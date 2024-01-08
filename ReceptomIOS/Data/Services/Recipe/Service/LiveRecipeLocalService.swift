//
//  LiveRecipeLocalService.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 8/1/24.
//

import Foundation
import SwiftUI
import SwiftData

struct LiveRecipeLocalService: RecipeLocalService {
    var emptyRecipe = Recipe(name: "", ingredients: "", instructions: "", serving: 0)
    let container = try! ModelContainer(for: CacheRecipe.self)
    @State var recipeList: [CacheRecipe] = []
    
    @MainActor
    var modelContext: ModelContext {
        container.mainContext
    }
    
    @MainActor
    func getAllRecipes() async throws -> [Recipe] {
        let fetchDescriptor = FetchDescriptor<CacheRecipe>()
        let recipeCacheList = try modelContext.fetch(fetchDescriptor)
        let mappedCacheRecipeList = recipeCacheList.map{ cachedRecipe in
            RecipeMapper.fromLocal(type:cachedRecipe)
        }
      
        return mappedCacheRecipeList
    }
    
    @MainActor
    func getRecipe(idRecipe: UUID) async throws -> Recipe {
        let fetchDescriptor = FetchDescriptor<CacheRecipe>()
        let allRecipes = try modelContext.fetch(fetchDescriptor)
        print("LiveService: \(allRecipes)" )
        if let cachedRecipe = allRecipes.first(where: { $0.id == idRecipe }) {
           
            return RecipeMapper.fromLocal(type: cachedRecipe)
        } else {
            return emptyRecipe
        }

    }
    
    @MainActor
    func addRecipe(recipe: Recipe) async throws {
        
        let mapRecipe = RecipeMapper.toLocal(type: recipe)
        mapRecipe.id = UUID()
        modelContext.insert(mapRecipe)
        do {
            try modelContext.save()
            print("Receta insertada")
            
        } catch {
            print("Error al guardar la receta en el contexto: \(error)")
        }
    
        
    }
    
    
    func deleteRecipe(recipe: Recipe) async throws {
        
    }
}
