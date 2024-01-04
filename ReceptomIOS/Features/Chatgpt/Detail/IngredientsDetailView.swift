//
//  IngredientsDetailView.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 3/1/24.
//

import SwiftUI
struct IngredientsDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: ChatgptViewModel
    
    init( viewModel: ChatgptViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                // Contenedor del nombre de la receta
                VStack {
                    Text("Nombre de la receta")
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
                            Text("Preparacion de la receta")
                            
                            // Ingredientes
                            Text("INGREDIENTES:")
                                .fontWeight(.bold)
                                .padding(.top, 10)
                                Text("1, 2 ,3 ")
                            
                            // Cantidad
                            Text("CANTIDAD:")
                                .fontWeight(.bold)
                                .padding(.top, 8)
                            Text("EJ 4 Personas")
                        }
                        .padding(12)
                        .background(Color.white)
                        .border(Color.gray)
                        .cornerRadius(8)
                    }
                    .frame(width: 300, height: 350)
                //}

                
                Spacer()
                
                // Botones Siguiente y Guardar
                HStack {
                    Button(action: {
                        let order = Order(ingredients: ["ingredient1", "ingredient2"], mode: true, recipeName: "RecipeName")
                            Task {
                                await viewModel.getChatgptResponse(order: order)
                            }
                      
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
          
        }
    }

  
}

#Preview {
    let coordinator = Coordinator()
    return coordinator.makeIngredientsDetailView()
}
