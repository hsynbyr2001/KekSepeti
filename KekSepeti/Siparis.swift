//
//  Siparis.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import Foundation

@Observable
class Siparis: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _speacialRequestEnabled = "speacialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
    }
    
    static let types = ["🍦 Vanilyalı", "🍓 Çilekli", "🍫 Çikolatalı", "🌈 Gökkuşağı"]
    
    var type = 0
    var quantity = 3
    
    var speacialRequestEnabled = false {
        didSet {
            if !speacialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    static let prices: [Decimal] = {
        var prices: [Decimal] = []
        
        for i in types.indices {
            prices.append(Decimal((i + 1)) * 2)
        }
        return prices
    }()
    
    var total: Decimal {
        Siparis.prices[type] * Decimal(quantity)
    }
    
    var cost: Decimal {
        var cost = total
        
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}
