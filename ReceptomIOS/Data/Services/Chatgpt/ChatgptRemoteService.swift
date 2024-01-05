//
//  ChatgptRemoteService.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

protocol ChatgptRemoteService {
    func getChatResponse(order: Order) async throws -> Recipe
}
