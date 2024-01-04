//
//  LiveChatgptRemoteService.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

import Foundation
struct LiveChatgptRemoteService: ChatgptRemoteService {
    private let networkClient : NetworkClient
    let requestBody = ChatgptRequestBody(model: ApiConstants.API_MODEL, prompt: "Hola quien eres y como te llamas.", maxTokens: 1000, temperature: 0)

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    func getChatResponse(order: Order) async throws -> [String] {
        print("LiveChatRemoteService ON")
        let response: ApiResponse<String> = try await networkClient.post(url: ApiConstants.API_URL, body: requestBody)
        print("LiveChatRemoteService => \(response)")
        return [""]
    }
}
