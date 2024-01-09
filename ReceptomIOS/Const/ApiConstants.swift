//
//  ApiConstants.swift
//  ReceptomIOS
//
//  Created by Pablo Mediero on 4/1/24.
//

import Foundation
struct ApiConstants {
    static let API_URL = "https://api.openai.com/v1/completions"
    
    // Estos ultimos dias OpenAi me ha eliminado 2 o 3 ApiKeys, si no funciona, avisame por teams.
    static let API_KEY = "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"

    static let API_MODEL = "gpt-3.5-turbo-instruct"
}
