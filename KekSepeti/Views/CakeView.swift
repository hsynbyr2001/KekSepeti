//
//  CakeView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//


import SwiftUI

struct CakeView: View {
    
    var order: Siparis
    var type: Int
    
    var body: some View {
        Button {
            order.type = type
        } label: {
            VStack(alignment: .leading) {
                Text("\(Siparis.types[type])")
                    .font(.largeTitle)
                Text("\(Siparis.prices[type], format: .currency(code: "TRY"))")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(.secondary)
        .clipShape(.rect(cornerRadius: 10))
        .foregroundStyle(order.type == type ? .green : .blue)
    }
}

#Preview {
    CakeView(order: Siparis(), type: 1)
}

