//
//  IngredientsListView.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 3/1/24.
//
import SwiftUI

struct IngredientsListView: View {
    @State private var ingredientsList: [String] = ["es","es","es",]
    @State private var isAddingIngredient = false
    @State private var newIngredient = ""
    @State private var showAlert = false
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        NavigationView {
            VStack {
                Text("Tabla de ingredientes")
                    .font(.headline)
                    .padding(EdgeInsets(top: 10.0, leading: 0, bottom: 0, trailing: 0))

                if ingredientsList.isEmpty {
                    Spacer()
                    Text("Lista vacía, pulsa en el botón 'Añadir' para agregar tantos ingredientes como quieras y posteriormente en el botón 'Buscar'.")
                        .italic()
                        .padding(EdgeInsets(top: 30.0, leading: 30.0, bottom: 30.0, trailing: 30.0))
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(ingredientsList, id: \.self) { item in
                            HStack {
                                Text(item)
                                    .padding(8.0)

                                Spacer()

                                Button(action: {
                                    // Eliminar el ingrediente al pulsar el botón de eliminar
                                    removeIngredient(item)
                                }) {
                                    Image(systemName: "xmark.circle")
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .foregroundColor(.black)
                            .frame(height: 40.0)
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 300, trailing: 30))
                   
                }

                Spacer()
                Text("Esta es la lista de ingredientes necesarios para encontrar una receta ")
                    .font(.subheadline)
                    .padding(EdgeInsets(top: 10.0, leading: 20, bottom: 20, trailing: 20))
                HStack(spacing: 16) {
                    Button(action: {
                        if !ingredientsList.isEmpty {

                            print("Navigate to Ingredients Detail")
                        } else {
                            // Mostrar un mensaje en SwiftUI
                            // En lugar de usar ScaffoldMessenger, puedes utilizar Alert o un Banner personalizado
                            // Dependiendo de la versión de SwiftUI y las bibliotecas que estés utilizando
                            showAlert = true
                        }
                    }) {
                        NavigationLink(destination: coordinator.makeIngredientsDetailView ){
                                               Label("Buscar", systemImage: "magnifyingglass")
                                                   .foregroundColor(.black)
                                                   .padding()
                                                   .background(Color.orange)
                                                   .cornerRadius(8)
                                                   .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                                           }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Lista de ingredientes vacía"),
                            message: Text("Introduce algún ingrediente antes de buscar."),
                            dismissButton: .default(Text("OK"))
                        )
                    }

                    Button(action: {
                        // Mostrar el diálogo para añadir ingredientes
                        isAddingIngredient = true
                    }) {
                        Label("Añadir", systemImage: "cart")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                    .sheet(isPresented: $isAddingIngredient) {
                        // Diálogo para añadir ingredientes
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Añadir Ingrediente")
                                .font(.title)
                                .padding()

                            TextField("Nuevo Ingrediente", text: $newIngredient)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            Button(action: {
                                // Añadir el nuevo ingrediente a la lista
                                ingredientsList.append(newIngredient)
                                newIngredient = ""
                                isAddingIngredient = false
                            }) {
                                Text("Añadir")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.orange)
                                    .cornerRadius(8)
                            }
                            .padding()
                        }
                        .padding()
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            }
        }
    }

    private func removeIngredient(_ ingredient: String) {
        // Eliminar el ingrediente de la lista
        if let index = ingredientsList.firstIndex(of: ingredient) {
            ingredientsList.remove(at: index)
        }
    }
}
#Preview {
    IngredientsListView()
}
