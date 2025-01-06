//
//  Profile.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 31.12.2024.
//

import Foundation

@Observable
class Profile: Codable {
    var name: String
    var addresses: [Address]
    
    init() {
        self.name = ""
        self.addresses = []
    }
}
