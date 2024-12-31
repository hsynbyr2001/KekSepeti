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
        .background(.secondary)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    CakeRowView(product: Cake(type: 1, quantity: 1, desc: "Kekimsi"))
}
