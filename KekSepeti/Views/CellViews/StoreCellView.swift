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
                    .bold()
                    .lineLimit(1)
                Text("\(store.address)")
                    .font(.subheadline)
                Label("\(store.rating, format: .number)", systemImage: "star.fill")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(height: 70)
    }
}

#Preview {
    StoreCellView(store: Store(name: "Pelin's Cakes", rating: 1.0, address: "Nişantaşı, İstanbul", image: "pelin", products: []))
}
