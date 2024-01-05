//
//  ChatgptRepository.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

struct ChatgptRepository {
    private let remoteService: ChatgptRemoteService
    
    init(remoteService: ChatgptRemoteService) {
        self.remoteService = remoteService
    }
    
    func getChatResponse(order: Order) async throws -> Recipe {
        try await remoteService.getChatResponse(order: order)
    }
}
