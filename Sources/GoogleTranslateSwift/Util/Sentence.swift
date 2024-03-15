//
//  Result.swift
//  
//
//  Created by Marcos Debastiani on 2/7/24.
//

import Foundation

public class Sentence: Codable {
    public var translation: String
    public var original: String
    
    enum CodingKeys: String, CodingKey {
        case translation = "trans"
        case original = "orig"
    }
}
