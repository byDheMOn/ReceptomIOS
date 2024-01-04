//
//  URLSessionNetworkClient.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

import Foundation

class URLSessionNetworkClient: NetworkClient {

    func post<T: Decodable, U: Encodable>(url: String, body: U) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkClientError.badUrl
        }
        print("Post ON")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer "+ApiConstants.API_KEY, forHTTPHeaderField: "Authorization")
        

        let (data, _) = try await URLSession.shared.data(from: url)
        print("POST Data: \(try JSONDecoder().decode(T.self, from: data))")
        return try  JSONDecoder().decode(T.self, from: data)
    }
}

