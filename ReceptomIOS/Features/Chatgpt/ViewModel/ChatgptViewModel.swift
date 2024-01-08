//
//  ChatgptViewModel.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

import Foundation
class ChatgptViewModel : ObservableObject {
    private let getChatgptResponseUseCase: GetChatgptResponseUseCase
    @Published var recipe = Recipe( name: "", ingredients: "", instructions: "", serving: 0)
    @Published var showErrorMessage = false
    init(getChatgptResponseUseCase: GetChatgptResponseUseCase) {
        self.getChatgptResponseUseCase = getChatgptResponseUseCase
    }
    
    func getChatgptResponse(order: Order) async {
        do {
            recipe = try await getChatgptResponseUseCase.execute(order: order)
        }catch {
            showErrorMessage = true
        }
    }
}
