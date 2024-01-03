//
//  HomePageView.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 3/1/24.
//
import SwiftUI


struct HomePageView: View {
    init() {
           // Configuración personalizada de la barra de navegación
           UINavigationBar.appearance().barTintColor = UIColor.black
           UINavigationBar.appearance().backgroundColor = UIColor.orange
       }

    var body: some View {
        NavigationView {
            ZStack {
                Color.orange.edgesIgnoringSafeArea(.all) // Fondo naranja para toda la vista
                
                TabView {
                    IngredientsListView()
                        .tabItem {
                            Label("Buscar", systemImage: "magnifyingglass")
                        }
                        .tag(0)

                    RecipesListView()
                        .tabItem {
                            Label("Recetas", systemImage: "book")
                        }
                        .tag(1)
                }
                .navigationTitle("Receptom")
                .accentColor(.black)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}


#Preview {
    HomePageView()
}
