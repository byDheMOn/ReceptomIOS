//
//  RecipeDetailView.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 3/1/24.
//

import SwiftUI
import SlidingTabView

struct RecipeDetailView: View {
    @State private var tabIndex = 0
    let nameRecipe: String
    let ingredientsRecipe: [String]
    let instructionsRecipe: String
    let servingRecipe: String
    
    var body: some View {
        
        VStack() {
            Image("iv_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .clipped()
        
                Text("\(nameRecipe)")
                    .font(.title)
                    .fontWeight(.bold)
            VStack{
                SlidingTabView(selection: $tabIndex, tabs: ["Ingredientes", "Preparación","Cantidad"], animation: .easeOut, selectionBarColor: .orange ).accentColor(.orange)
            }
            if tabIndex == 0 {
                ForEach(ingredientsRecipe, id: \.self) { ingredient in
                              Text(ingredient)
                                  .padding(.bottom, 5)
                          }
            } else if tabIndex == 1 {
                Text("\(instructionsRecipe)")
            } else if tabIndex == 2 {
                Text("\(servingRecipe)")
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
    }
}



struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(
            nameRecipe: "Nombre de la receta",
            ingredientsRecipe: ["Ingrediente 1", "Ingrediente 2", "Ingrediente 3"],
            instructionsRecipe: "Instrucciones para la receta...",
            servingRecipe: "4 personas"
        )
    }
}
