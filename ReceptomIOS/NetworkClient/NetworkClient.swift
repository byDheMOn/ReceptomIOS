//
//  NetworkClient.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

protocol NetworkClient {
    func post<T: Decodable, U: Encodable>(url: String, body: U) async throws -> T

}
