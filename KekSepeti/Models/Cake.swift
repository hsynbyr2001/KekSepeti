//
//  Cake.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 30.12.2024.
//

import Foundation

@Observable
class Cake {
    
    var type: Int
    var name: String
    var quantity: Int
    var desc: String
    
    static let types = ["🍦 Vanilyalı", "🥮 Tarçınlı", "🌈 Gökkuşağı", "🍒 Vişneli", "🌰 Fındıklı",
                        "🍓 Çilekli", "🍫 Çikolatalı", "🍌 Muzlu", "🍊 Portakallı", "🥭 Mangolu",
                        "🥥 Coco", "🫐 Böğürtlenli", "🍍 Ananaslı",  "🍋 Limonlu", "🍏 Elmalı", "🥜 Fıstıklı"
    ]
    
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
    
    static let prices: [Decimal] = {
        var prices: [Decimal] = []
        
        for i in types.indices {
            prices.append(Decimal((i + 1)) * 2)
        }
        return prices
    }()
    
    var subTotal: Decimal {
        Cake.prices[type] * Decimal(quantity)
    }
    
    var cost: Decimal {
        var cost = subTotal
        
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
    
    init(type: Int, quantity: Int, desc: String) {
        self.type = type
        self.quantity = quantity
        self.name = Cake.types[type]
        self.desc = desc
    }
}

