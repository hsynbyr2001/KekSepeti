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
            if bucket.products.isEmpty {
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
                        ForEach(bucket.products.indices, id: \.self) { indexPath in
                            if !bucket.products.isEmpty {
                                NavigationLink("\(bucket.products[indexPath].name), \(bucket.products[indexPath].quantity) adet, \(bucket.products[indexPath].cost, format: .currency(code: "TRY"))") {
                                    CakeDetailView(cake: bucket.products[indexPath], bucket: bucket, indexPath: indexPath)
                                }
                            }
                        }
                        .onDelete(perform: deleteProduct)
                    }
                    Section("Toplam") {
                        Text("\(bucket.total, format: .currency(code: "TRY"))")
                            .font(.title)
                    }
                    NavigationLink("Sepeti Onayla") {
                        AddressView(bucket: bucket, profile: profile)
                            //.toolbar(.hidden, for: .navigationBar)
                    }
                    .disabled(bucket.products.isEmpty)
                    .accessibilityIdentifier("ConfirmBucket")
                }
                .navigationTitle("Sepetim")
            }
        }
    }
    
    func deleteProduct(at offsets: IndexSet) {
        bucket.products.remove(atOffsets: offsets)
    }
}

#Preview {
    BucketView(bucket: Bucket(products: []), profile: Profile())
}
