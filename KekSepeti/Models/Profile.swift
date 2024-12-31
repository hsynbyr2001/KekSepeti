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
    var area: String
    var city: String
    var zip: String
    var isRememberMeOn = false
    
    init() {
        self.name = ""
        self.area = ""
        self.city = ""
        self.zip = ""
    }
    
    var hasValidAddress: Bool {
        if name.isEmpty || area.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
}
