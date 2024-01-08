//
//  IngredientsDetailView.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 3/1/24.
//

import SwiftUI
struct IngredientsDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var chatgptViewModel: ChatgptViewModel
    @StateObject private var recipeViewModel: RecipeViewModel
    private var ingredientsList: [String]
    @State private var isLoading = true
    init(chatgptViewModel: ChatgptViewModel, recipeViewModel: RecipeViewModel, ingredientsList: [String]) {
        _chatgptViewModel = StateObject(wrappedValue: chatgptViewModel)
        _recipeViewModel = StateObject(wrappedValue: recipeViewModel)
            self.ingredientsList = ingredientsList
        }
    var body: some View {
        VStack {
            Spacer()
            
                VStack {
                    if isLoading {
                        Spacer()
                        ProgressView()
                        Spacer()
                    } else {
                        VStack {
                            Text(chatgptViewModel.recipe.name)
                                .fontWeight(.bold)
                                .padding()
                                .background(Color.white)
                                .border(Color.gray)
                                .cornerRadius(8)
                                .padding(.vertical, 32)
                        }
                        .frame(width: 500)
                        VStack() {
                            ScrollView {
                                // Preparación
                                Text("PREPARACION:")
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                Text(chatgptViewModel.recipe.instructions)
                                
                                // Ingredientes
                                Text("INGREDIENTES:")
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                Text(ingredientsList.joined())
                                
                                // Cantidad
                                Text("CANTIDAD:")
                                    .fontWeight(.bold)
                                    .padding(.top, 8)
                                Text("\(chatgptViewModel.recipe.serving) Personas")
                            }
                            .padding(12)
                            .background(Color.white)
                            .border(Color.gray)
                            .cornerRadius(8)
                        }
                        .frame(width: 300, height: 350)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            
                            
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
                            let recipeToSave = Recipe(
                                name: chatgptViewModel.recipe.name,
                                ingredients:chatgptViewModel.recipe.ingredients,
                                instructions: chatgptViewModel.recipe.instructions,
                                serving: chatgptViewModel.recipe.serving)
                            Task {
                                do {
                                    await recipeViewModel.fetchAddRecipes(recipe: recipeToSave)
                                } catch {
                                    // Maneja el error según sea necesario
                                    print("Error al cargar datos: \(error)")
                                }
                            }
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
                
                .padding()
                .onAppear {
                    let order = Order(ingredients: ingredientsList, mode: true, recipeName: "")
                    Task {
                        do {
                            await chatgptViewModel.getChatgptResponse(order: order)
                        } catch {
                            // Maneja el error según sea necesario
                            print("Error al cargar datos: \(error)")
                        }
                    }
                }
                .onChange(of: chatgptViewModel.recipe) { newValue in
                            // Este bloque se ejecutará cuando myVariable cambie
                            isLoading = false
                }
                
            }
        
    }
}
