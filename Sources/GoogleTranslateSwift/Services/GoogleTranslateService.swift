//
//  GoogleTranslateService.swift
//
//
//  Created by Marcos Debastiani on 2/7/24.
//

import Foundation

enum TranslateError: Error {
    case invalidURL
    case translationFailed
    
    var reason: String {
        switch self {
        case .invalidURL:
            return "Invalid or malformed URL"
        case .translationFailed:
            return "Translation failed"
        }
    }
}

public class GoogleTranslateService {
    public static let shared = GoogleTranslateService()
    private init() { }
    
    public func translate(text: String, source: Language, target: Language) async throws -> Sentence {        
        let baseURL = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=\(source.rawValue)&tl=\(target.rawValue)&dt=t&dt=bd&dj=1&q=\(text)"
        guard let url = URL(string: baseURL) else {
            throw TranslateError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let result = try JSONDecoder().decode(Translation.self, from: data).sentences.first else {
            throw TranslateError.translationFailed
        }
        return result
    }
}
