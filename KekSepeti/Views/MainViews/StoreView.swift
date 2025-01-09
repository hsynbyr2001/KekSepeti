//
//  StoreView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 30.12.2024.
//

import SwiftUI

struct StoreView: View {
    
    var store: Store
    @State var bucket: Bucket
    @State var profile: Profile
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Hakkında") {
                    Text("\(store.address), \(store.rating, format: .number)")
                        .font(.subheadline)
                }
                Section("Değerlendirmeler") {
                    ScrollView {
                        UsersView()
                            .frame(height: 190)
                    }
                }
                Section("Kekler") {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(store.products.indices, id: \.self) { indexPath in
                                let product = store.products[indexPath]
                                
                                NavigationLink(destination: CakeDetailView(cake: store.products[indexPath], bucket: bucket, indexPath: indexPath)) {
                                    CakeRowView(product: product)
                                }
                                .accessibilityIdentifier("CakeButton\(indexPath)")
                            }
                        }
                    }
                    .padding(.top)
                }
            }
            .navigationTitle("\(store.name)")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: BucketView(bucket: bucket, profile: profile)) {
                        Text("🛒 \(bucket.allProducts().count)")
                            .font(.headline)
                            .bold()
                            .padding(6)
                            .background(.gray.opacity(0.3))
                            .clipShape(.rect(cornerRadius: 6))
                    }
                    .accessibilityIdentifier("BucketButton")
                }
            }
        }
    }
}

#Preview {
    StoreView(store: stores[0], bucket: Bucket(products: []), profile: Profile())
}
