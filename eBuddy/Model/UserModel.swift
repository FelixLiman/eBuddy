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
    let name: String?
    let isOnline: Bool?
    let games: [String]?
    let rating: Double?
    let ratingCount: Int?
    let price: Double?
    let email: String?
    let phoneNumber: String?
    let recentlyActive: Int?
    var gender: UserGender?
    
    enum CodingKeys: String, CodingKey {
        case uid
        case name
        case isOnline = "online"
        case games = "games_played"
        case rating
        case ratingCount = "total_rating"
        case price
        case email
        case phoneNumber = "phone"
        case recentlyActive = "last_active"
        case gender = "ge"
    }
    
    init(uid: String?, name: String?, isOnline: Bool?, games: [String]?, rating: Double?, ratingCount: Int?, price: Double?, email: String?, phoneNumber: String?, recentlyActive: Int?, gender: Int) {
        self.uid = uid
        self.name = name
        self.isOnline = isOnline
        self.games = games
        self.rating = rating
        self.ratingCount = ratingCount
        self.price = price
        self.email = email
        self.phoneNumber = phoneNumber
        self.recentlyActive = recentlyActive
        self.gender = UserGender(rawValue: gender)
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.isOnline = try container.decodeIfPresent(Bool.self, forKey: .isOnline)
        self.games = try container.decodeIfPresent([String].self, forKey: .games)
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating)
        self.ratingCount = try container.decodeIfPresent(Int.self, forKey: .ratingCount)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        self.recentlyActive = try container.decodeIfPresent(Int.self, forKey: .recentlyActive)
        self.gender = nil
        if let gender = try container.decodeIfPresent(Int.self, forKey: .gender) {
            self.gender = UserGender(rawValue: gender)
        }
    }
}
