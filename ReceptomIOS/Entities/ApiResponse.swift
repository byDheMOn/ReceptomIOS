//
//  ApiResponse.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

struct ApiResponse<T: Decodable>: Decodable {
    let id: String
    let choices: [OpenAICompetionsChoice]
}
struct OpenAICompetionsChoice: Decodable {
    let text: String
}
