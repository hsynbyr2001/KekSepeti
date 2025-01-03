//
//  Store.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 30.12.2024.
//

import Foundation

class Store {
    
    var id: UUID
    var name: String
    var rating: Double = 5.0
    var address: String
    var image: String
    
    var products: [Cake] = []
    
    init(name: String = "", rating: Double, address: String, image: String, products: [Cake]) {
        self.id = UUID()
        self.name = name
        self.rating = rating
        self.address = address
        self.image = image
        self.products = products
    }
    
    deinit {
        print("store deallocated")
    }
}
