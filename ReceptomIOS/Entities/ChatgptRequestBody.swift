//
//  ChatgptRequestBody.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

import Foundation
struct ChatgptRequestBody: Encodable {
    let model: String
    let prompt: String
    let maxTokens: Int
    let temperature: Double
    init(model: String, prompt: String, maxTokens: Int, temperature: Double) {
        self.model = model
        self.prompt = prompt
        self.maxTokens = maxTokens
        self.temperature = temperature
    }
}
