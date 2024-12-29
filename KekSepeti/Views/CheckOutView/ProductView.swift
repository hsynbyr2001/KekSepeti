//
//  ProductView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI

struct ProductView: View {
    
    var order: Siparis
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(order.quantity)x \(Siparis.types[order.type]) \(order.total, format: .currency(code: "TRY"))")
            Text("\(order.extraFrosting ? "Ekstra kremalı. (\(order.quantity, format: .currency(code: "TRY"))+)" : "Ekstra kremasız.") \(order.addSprinkles ? "Ekstra serpmeli. (\(order.quantity, format: .currency(code: "TRY"))+)" : "Ekstra serpmesiz.")")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ProductView(order: Siparis())
}
