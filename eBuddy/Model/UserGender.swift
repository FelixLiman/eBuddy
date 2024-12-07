//
//  UserGender.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import Foundation

enum UserGender: Int, Codable {
    case female = 0
    case male = 1
    
    func asString() -> String {
        switch self {
        case .female: return "Female"
        case .male: return "Male"
        }
    }
    
    static func random() -> UserGender {
        return UserGender(rawValue: Int.random(in: 0...1))!
    }
}
