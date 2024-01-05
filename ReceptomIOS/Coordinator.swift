//
//  Coordinator.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

import Foundation

class Coordinator: ObservableObject {
    @Published var isDetailViewPresented = false
    private let chatgptRepository: ChatgptRepository
    private let getChatgptResponseUseCase: GetChatgptResponseUseCase
    private let liveChatgptRemoteService: LiveChatgptRemoteService
    
    init() {
        let networkClient = URLSessionNetworkClient()
        liveChatgptRemoteService = LiveChatgptRemoteService(networkClient: networkClient)
        chatgptRepository = ChatgptRepository(remoteService: liveChatgptRemoteService)
        getChatgptResponseUseCase = GetChatgptResponseUseCase(chatgptRepository: chatgptRepository)
    }
    
    func makeHomePageView() -> HomePageView {
        HomePageView()
    }
    
    func makeRecipeListView() -> RecipesListView {
        RecipesListView()
    }
    
    func makeRecipeDetailView() -> RecipeDetailView {
        RecipeDetailView()
    }
    
    func makeIngredientsListView() -> IngredientsListView {
        IngredientsListView(viewModel: makeChatgptViewModel())
    }
    
    
    func makeIngredientsDetailView(with ingredientsList: [String]) -> IngredientsDetailView {
            let viewModel = makeChatgptViewModel()
            return IngredientsDetailView(viewModel: viewModel, ingredientsList: ingredientsList)
        }
    
    private func makeChatgptViewModel() -> ChatgptViewModel {
        .init(getChatgptResponseUseCase: getChatgptResponseUseCase)
    }
}
