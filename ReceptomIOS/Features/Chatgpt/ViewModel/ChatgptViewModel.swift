//
//  ChatgptViewModel.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

import Foundation
class ChatgptViewModel : ObservableObject {
    private let getChatgptResponseUseCase: GetChatgptResponseUseCase
    @Published var recipe = [String]()
    @Published var showErrorMessage = false
    init(getChatgptResponseUseCase: GetChatgptResponseUseCase) {
        self.getChatgptResponseUseCase = getChatgptResponseUseCase
    }
    
    func getChatgptResponse(order: Order) async {
        do {
            print("ViewModel ON")
            recipe = try await getChatgptResponseUseCase.execute(order: order)
            print("ViewModel ON")
        }catch {
            showErrorMessage = true
        }
    }
}
