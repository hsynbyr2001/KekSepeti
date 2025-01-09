//
//  StoreListView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 30.12.2024.
//

import SwiftUI

struct StoreListView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @State private var bucket = Bucket(products: [])
    @State var profile = Profile()
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    Section("Mağazalar") {
                        ForEach(stores.indices, id: \.self) { indexPath in
                            NavigationLink(destination: StoreView(store: stores[indexPath], bucket: bucket, profile: profile)) {
                                StoreCellView(store: stores[indexPath])
                            }
                            .accessibilityIdentifier("StoreCell\(indexPath)")
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
                            Text("🛒 \(bucket.allProducts().count)")
                                .font(.headline)
                                .bold()
                                .padding(6)
                                .background(.gray.opacity(0.3))
                                .clipShape(.rect(cornerRadius: 6))
                        }
                    }
                }
                .onAppear {
                    loadProfile()
                }
                SnowView()
                    .allowsHitTesting(false)
            }
        }
        .onChange(of: scenePhase) { oldPhase, newPhase in
            switch newPhase {
            case .active: print("active")
            case .inactive: print("inactive")
            case .background: print("background")
            default: break
            }
        }
    }
}

#Preview {
    StoreListView()
}
