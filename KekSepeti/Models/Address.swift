//
//  Address.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 5.01.2025.
//

import Foundation

@Observable
class Address: Codable {
    var id = UUID()
    var area: String
    var city: String
    var zip: String
    
    let cities = ["İstanbul", "İzmir", "Ankara"]
    
    var hasValidAddress: Bool {
        if area.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    init(area: String, city: String, zip: String) {
        self.area = area
        self.city = city
        self.zip = zip
    }
}
