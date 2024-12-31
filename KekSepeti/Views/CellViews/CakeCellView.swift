//
//  ProductView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI

struct CakeCellView: View {
    
    @State var cake: Cake
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(cake.quantity)x \(Cake.types[cake.type]) \(cake.cost, format: .currency(code: "TRY"))")
                Text("\(cake.extraFrosting ? "Ekstra kremalı. (\(cake.quantity, format: .currency(code: "TRY"))+)" : "Ekstra kremasız.") \(cake.addSprinkles ? "Ekstra serpmeli. (\(cake.quantity, format: .currency(code: "TRY"))+)" : "Ekstra serpmesiz.")")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Stepper("\(cake.quantity)", value: $cake.quantity, in: 1...20)
                .labelsHidden()
        }
        
    }
}

#Preview {
    CakeCellView(cake: Cake(type: 0, quantity: 1, desc: "kek açıklaması"))
}
