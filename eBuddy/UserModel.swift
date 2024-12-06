//
//  UserModel.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import Foundation

struct UserModel: Codable, Identifiable {
    let id = UUID()
    let uid: String?
    let email: String?
    let phoneNumber: String?
    var gender: UserGender?
    
    enum CodingKeys: String, CodingKey {
        case uid
        case email
        case phoneNumber = "phone"
        case gender = "ge"
    }
    
    init(uid: String?, email: String?, phoneNumber: String?, gender: Int) {
        self.uid = uid
        self.email = email
        self.phoneNumber = phoneNumber
        self.gender = UserGender(rawValue: gender)
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        self.gender = nil
        if let gender = try container.decodeIfPresent(Int.self, forKey: .gender) {
            self.gender = UserGender(rawValue: gender)
        }
    }
}

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
