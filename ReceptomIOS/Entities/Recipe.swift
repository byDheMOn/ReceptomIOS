//
//  Recipe.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 4/1/24.
//

struct Recipe: Identifiable, Decodable {
    var id: Int?
    var name: String
    var ingredients: String
    var instructions: String
    var serving: Int
    
    init(id: Int?, name: String, ingredients: String, instructions: String, serving: Int) {
          self.id = id
          self.name = name
          self.ingredients = ingredients
          self.instructions = instructions
          self.serving = serving
      }
}
