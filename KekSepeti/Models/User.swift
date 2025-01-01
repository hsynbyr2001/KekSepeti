//
//  User.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 1.01.2025.
//

import Foundation

struct UserResponse: Codable {
    let results: [User]
}

struct User: Codable, Identifiable {
    let id = UUID()
    let name: Name
    let picture: Picture
    
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
    }
    
    struct Picture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
}
