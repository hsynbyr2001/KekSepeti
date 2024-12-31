//
//  Bucket.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 30.12.2024.
//

import Foundation

@Observable
class Bucket {
    var products: [Cake]
    
    var total: Decimal {
        var total: Decimal = 0
        
        for product in products {
            total += product.cost
        }
        print("Sepet toplamı: \(total)")
        return total
    }
    
    init(products: [Cake]) {
        self.products = products
    }
}
