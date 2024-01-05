//
//  Recipe.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

struct Recipe: Identifiable, Decodable, Equatable {
    var id: Int?
    var name: String
    var ingredients: String
    var instructions: String
    var serving: Int
    
}
