//
//  GPTRequest.swift
//  ChatBot
//
//  Created by 김진웅 on 1/5/24.
//

import Foundation

struct GPTRequest: APIRequestable {
    let baseURL: URL? = URL(string: "https://api.openai.com/v1/chat/completions")
    let headerFeilds: [String : String]
    let httpBodyData: Data?
    
    init?(httpBodyData: Encodable) {
        guard let apiKey = Bundle.main.gptAPIKey,
              let encodedData = try? JSONEncoder().encode(httpBodyData)
        else {
            return nil
        }
        self.httpBodyData = encodedData
        headerFeilds = [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type" : "application/json"
        ]
    }
}