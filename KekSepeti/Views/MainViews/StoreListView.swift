//
//  StoreListView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 30.12.2024.
//

import SwiftUI

struct StoreListView: View {
    
    @State private var bucket = Bucket(products: [])
    @State private var profile = Profile()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Mağazalar") {
                    ForEach(stores.indices, id: \.self) { indexPath in
                        NavigationLink(destination: StoreView(store: stores[indexPath], bucket: bucket, profile: profile)) {
                            StoreCellView(store: stores[indexPath])
                        }
                    }
                }
                NavigationLink("Hakkında") {
                    AboutView()
                }
            }
            .navigationTitle("KekSepeti🧁")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: BucketView(bucket: bucket, profile: profile)) {
                        Text("🛒 \(bucket.products.count)")
                            .font(.headline)
                            .bold()
                            .padding(6)
                            .background(.secondary)
                            .clipShape(.rect(cornerRadius: 6))
                    }
                }
            }
            .onAppear {
                let defaults = UserDefaults.standard
                do {
                    if let savedData = defaults.data(forKey: "profile") {
                        let decodedObject = try JSONDecoder().decode(Profile.self, from: savedData)
                        print("Class retrieved successfully: \(decodedObject.name), \(decodedObject.city)")
                        profile = decodedObject
                    } else {
                        print("No data found for the key.")
                    }
                } catch {
                    print("Failed to decode object: \(error)")
                }
            }
        }
    }
}

#Preview {
    StoreListView()
}
