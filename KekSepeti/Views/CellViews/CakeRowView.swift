//
//  CakeRowView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 31.12.2024.
//

import SwiftUI

struct CakeRowView: View {
    
    var product: Cake
    
    var body: some View {
        let cakeInfo = product.name
        
        VStack {
            if let emoji = cakeInfo.first {
                Text("\(emoji)")
                    .font(.system(size: 50))
            } else {
                Text("☹️")
            }
            Text("\(String(cakeInfo.dropFirst()))")
                .font(.subheadline)
            Text("\(product.cost, format: .currency(code: "TRY"))")
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .padding()
        .background(.gray.opacity(0.3))
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            Circle()
                .fill(product.quantity > 1 ? .red.opacity(0.3) : .gray.opacity(0.3))
                .frame(width: 30, height: 30)
                .padding(5)
                .overlay(
                    Text(product.quantity > 1 ? "\(product.quantity)" : "+")
                        .bold()
                        .foregroundStyle(.white)
                )
            ,
            alignment: .topTrailing
        )
    }
}

#Preview {
    CakeRowView(product: Cake(type: 1, quantity: 1, desc: "Kekimsi"))
}
