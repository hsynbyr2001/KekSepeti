//
//  Bucket.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 30.12.2024.
//

import Foundation

@Observable
class Bucket {
    private var products: [Cake]
    
    private var total: Decimal {
        let productCosts = products.map { $0.cost }
        let total: Decimal = productCosts.reduce(0, +)
        print("Sepet toplamı: \(total)")
        return total
    }
    
    init(products: [Cake]) {
        self.products = products
    }
    
    func addProduct(_ cake: Cake) {
        self.products.append(cake)
    }
    
    func updateProduct(of index: Int, with cake: Cake) {
        self.products[index] = cake
    }
    
    func deleteProduct(at offsets: IndexSet) {
        self.products.remove(atOffsets: offsets)
    }
    
    func allProducts() -> [Cake] {
        return self.products
    }
    
    func product(at index: Int) -> Cake {
        return self.products[index]
    }
    
    func allTotal() -> Decimal {
        return self.total
    }
}
