//
//  Profile.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 31.12.2024.
//

import Foundation

@Observable
class Profile: Codable {
    var image: Data
    var name: String
    var addresses: [Address]
    
    init() {
        self.image = Data()
        self.name = ""
        self.addresses = []
    }
    
    func save() {
        let defaults = UserDefaults.standard
        
        do {
            let encodedData = try JSONEncoder().encode(self)
            defaults.set(encodedData, forKey: "profile")
            print("Profile saved successfully!")
        } catch {
            print("Failed to encode and save object: \(error)")
        }
    }
}
