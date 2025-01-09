//
//  BucketView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 30.12.2024.
//

import SwiftUI

struct BucketView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var bucket: Bucket
    @State var profile: Profile
    
    var body: some View {
        NavigationStack {
            if bucket.allProducts().isEmpty {
                ContentUnavailableView {
                    Label("Sepetin Boş", systemImage: "exclamationmark.bubble.fill")
                } description: {
                    Text("Sepetine biraz kek ekle!")
                } actions: {
                    Button("Tamam", action: {
                        dismiss()
                    })
                    .buttonStyle(.borderedProminent)
                }
            }
            else {
                List {
                    Section("Ürünler") {
                        ForEach(bucket.allProducts().indices, id: \.self) { indexPath in
                            if !bucket.allProducts().isEmpty {
                                let product = bucket.product(at: indexPath)
                                NavigationLink("\(product.name), \(product.quantity) adet, \(product.cost, format: .currency(code: "TRY"))") {
                                    CakeDetailView(cake: product, bucket: bucket, indexPath: indexPath)
                                }
                            }
                        }
                        .onDelete(perform: bucket.deleteProduct)
                    }
                    Section("Toplam") {
                        Text("\(bucket.allTotal(), format: .currency(code: "TRY"))")
                            .font(.title)
                    }
                    NavigationLink("Sepeti Onayla") {
                        AddressView(bucket: bucket, profile: profile)
                            //.toolbar(.hidden, for: .navigationBar)
                    }
                    .disabled(bucket.allProducts().isEmpty)
                    .accessibilityIdentifier("ConfirmBucket")
                }
                .navigationTitle("Sepetim")
            }
        }
    }
}

#Preview {
    BucketView(bucket: Bucket(products: []), profile: Profile())
}
