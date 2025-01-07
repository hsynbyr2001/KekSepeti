//
//  CakeDetailController.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 7.01.2025.
//

extension CakeDetailView {
    func addToBucket() {
        
        var isContaining = isItemAlreadyInBucket()
        
        if !isContaining {
            bucket.products.append(cake)
            print("Ürün sepete eklendi.")
        }
        dismiss()
    }
    
    func isItemAlreadyInBucket() -> Bool {
        
        for (index, product) in bucket.products.enumerated() {
            if product.type == cake.type {
                bucket.products[index] = cake
                print("Ürün zaten sepete eklenmiş. Ürün güncellendi.")
                return true
            }
        }
        
        return false
    }
}
