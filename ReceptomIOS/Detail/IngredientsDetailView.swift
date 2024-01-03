//
//  IngredientsDetailView.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 3/1/24.
//

import SwiftUI
struct IngredientsDetailView: View {
    let nameRecipe: String
    let ingredientsRecipe: [String]
    let instructionsRecipe: String
    let servingRecipe: String
    @State private var isLoading: Bool = false

    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                // Contenedor del nombre de la receta
                VStack {
                    Text(nameRecipe)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .border(Color.gray)
                        .cornerRadius(8)
                        .padding(.vertical, 32)
                }
                .frame(width: 300)
                
                // Contenido visible cuando no está cargando
               // if !isLoading {
                   
                    VStack() {
                            ScrollView {
                            // Preparación
                            Text("PREPARACION:")
                                .fontWeight(.bold)
                                .padding(.top, 10)
                            Text(instructionsRecipe)
                            
                            // Ingredientes
                            Text("INGREDIENTES:")
                                .fontWeight(.bold)
                                .padding(.top, 10)
                            ForEach(ingredientsRecipe, id: \.self) { ingredient in
                                Text(ingredient)
                            }
                            
                            // Cantidad
                            Text("CANTIDAD:")
                                .fontWeight(.bold)
                                .padding(.top, 8)
                            Text(servingRecipe)
                        }
                        .padding(12)
                        .background(Color.white)
                        .border(Color.gray)
                        .cornerRadius(8)
                    }
                    .frame(width: 300, height: 350)
                //}
                
                // Contenido visible cuando está cargando
                if isLoading {
                 
                }
                
                Spacer()
                
                // Botones Siguiente y Guardar
                HStack {
                    Button(action: {
                        // Acción para Siguiente
                        _loadRecipe(false, nameRecipe)
                    }) {
                        Text("Siguiente")
                        Image(systemName: "arrow.right.circle.fill")
                    }
                    .padding()
                    .background(Color(.systemOrange))
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                    
                    Button(action: {
                        // Acción para Guardar
                       
                        // Mostrar diálogo de guardado
                        // ...
                    }) {
                        Text("Guardar")
                        Image(systemName: "square.and.arrow.down.fill")
                    }
                    .padding()
                    .background(Color(.systemOrange))
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                }
                .padding(.bottom, 16)
            }
        }
        .padding()
        .onAppear {
            // Inicialización y carga de datos
            _loadRecipe(true, nameRecipe)
        }
    }

    private func _loadRecipe(_ isLoading: Bool, _ nameRecipe: String) {
        // Lógica para cargar la receta
        // ...
        
        // Actualizar estado de carga
        self.isLoading = isLoading
    }
}

#Preview {
    IngredientsDetailView(nameRecipe: "Nombre de la receta",
                          ingredientsRecipe: ["Ingrediente 1", "Ingrediente 2", "Ingrediente 3"],
                          instructionsRecipe: "Instrucciones para la receta...",
                          servingRecipe: "4 personas")
}
