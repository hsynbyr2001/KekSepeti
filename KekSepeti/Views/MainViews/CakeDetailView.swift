//
//  CakeDetailView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 30.12.2024.
//

import SwiftUI

struct CakeDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var cake: Cake
    @State var bucket: Bucket
    var indexPath: Int
    
    var body: some View {
        
        NavigationStack {
            List {
                Section("Hakkında") {
                    Text("\(cake.desc)")
                }
                Section("Ekstra") {
                    Toggle("Kek için özel eklemeler?", isOn: $cake.speacialRequestEnabled.animation())
                    
                    if cake.speacialRequestEnabled {
                        Toggle("Ekstra krema ekleyin (\(cake.quantity, format: .currency(code: "TRY"))+)", isOn: $cake.extraFrosting)
                        Toggle("Ekstra serpme ekleyin (\(Float(cake.quantity) / 2, format: .currency(code: "TRY"))+)", isOn: $cake.addSprinkles)
                    }
                }
                Section("Toplam") {
                    HStack {
                        Stepper("\(cake.quantity)", value: $cake.quantity, in: 1...20)
                            .labelsHidden()
                        Text("\(cake.quantity)")
                            .font(.title)
                        Spacer()
                        Text("\(cake.cost, format: .currency(code: "TRY"))")
                            .font(.title)
                    }
                }
                Button {
                    if bucket.products.indices.contains(indexPath) && bucket.products[indexPath].type == cake.type {
                        bucket.products[indexPath] = cake
                        print("Ürün zaten sepete eklenmiş. Ürün güncellendi.")
                    }
                    else {
                        bucket.products.append(cake)
                        print("Ürün sepete eklendi.")
                    }
                    dismiss()
                } label: {
                    Text("Sepete Ekle")
                }
            }
            .navigationTitle("\(cake.name)")
        }
    }
}

#Preview {
    CakeDetailView(cake: Cake(type: 1, quantity: 1, desc: "Harika çilek dolgulu ve tatlı serpintili mükemmel bir kek."), bucket: Bucket(products: []), indexPath: 0)
}
