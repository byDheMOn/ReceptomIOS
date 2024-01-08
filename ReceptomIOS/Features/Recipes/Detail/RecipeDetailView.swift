//
//  RecipeDetailView.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 3/1/24.
//

import SwiftUI
import SlidingTabView
struct RecipeDetailView: View {
    private var idRecipe: UUID
    @StateObject private var recipeViewModel: RecipeViewModel
    @State private var tabIndex = 0
    @EnvironmentObject var coordinator: Coordinator
    
    init(recipeViewModel: RecipeViewModel, idRecipe: UUID) {
        _recipeViewModel = StateObject(wrappedValue: recipeViewModel)
        self.idRecipe = idRecipe
    }
    
    var body: some View {
        VStack() {
            Image("iv_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .clipped()
            
            Text(recipeViewModel.recipe.name)
                .font(.title)
                .fontWeight(.bold)
            
            VStack {
                SlidingTabView(selection: $tabIndex, tabs: ["Ingredientes", "Preparación","Cantidad"], animation: .easeOut, selectionBarColor: .orange ).accentColor(.orange)
            }
            
            if tabIndex == 0 {
                Text(recipeViewModel.recipe.ingredients)
                    .padding(.bottom, 5)
            } else if tabIndex == 1 {
                Text(recipeViewModel.recipe.instructions)
            } else if tabIndex == 2 {
                Text("\(recipeViewModel.recipe.serving) personas")
            }
            
            Spacer()
        }
        .navigationBarItems(trailing:
            HStack {
                Button(action: {
                    // Acción del segundo botón
                }) {
                    Image(systemName: "trash").foregroundColor(.black)
                }
            }
        )
        .onAppear {
            Task {
                do {
                    await recipeViewModel.fetchGetRecipes(idRecipe: idRecipe)
                } catch {
                    // Maneja el error según sea necesario
                    print("Error al cargar datos: \(error)")
                }
            }
        }
        
    }
}
