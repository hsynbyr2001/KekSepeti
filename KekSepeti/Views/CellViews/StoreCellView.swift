//
//  StoreCellView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 31.12.2024.
//

import SwiftUI

struct StoreCellView: View {
    var store: Store
    
    var body: some View {
        HStack {
            Image(store.image)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(.rect(cornerRadius: 10))
                .padding(4)
            VStack(alignment: .leading) {
                Text("\(store.name)")
                    .font(.title2)
                Label("\(store.rating, format: .number)", systemImage: "star.fill")
                    .foregroundStyle(.secondary)
            }
        }
        
    }
}

#Preview {
    StoreCellView(store: Store(rating: 1.0, address: "", image: "pelin", products: []))
}
