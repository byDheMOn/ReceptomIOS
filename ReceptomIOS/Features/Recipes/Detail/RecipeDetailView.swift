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
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        
        VStack() {
            Image("iv_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .clipped()
        
                Text("Nombre de la receta")
                    .font(.title)
                    .fontWeight(.bold)
            VStack{
                SlidingTabView(selection: $tabIndex, tabs: ["Ingredientes", "Preparación","Cantidad"], animation: .easeOut, selectionBarColor: .orange ).accentColor(.orange)
            }
            if tabIndex == 0 {
          
                              Text("Ingrediente 1")
                                  .padding(.bottom, 5)
                          
            } else if tabIndex == 1 {
                Text("Instrucciones para la receta...")
            } else if tabIndex == 2 {
                Text("4 personas")
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



#Preview {
    let coordinator = Coordinator()
    return coordinator.makeRecipeDetailView()
}
