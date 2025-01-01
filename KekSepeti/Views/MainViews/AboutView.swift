//
//  AboutView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 1.01.2025.
//

import SwiftUI

struct AboutView: View {
    @State private var showAppStore = false
    
    let appID = "6446176412"
    
    var body: some View {
        Image("hüs")
            .resizable()
            .frame(width: 70, height: 70)
            .clipShape(.circle)
        Text("Hüseyin Bayır")
            .font(.title)
        Text("iOS Developer")
            .font(.footnote)
            .padding(.bottom)
        HStack {
            Button("App Store", action: {
                showAppStore = true
            })
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showAppStore) {
            AppStoreView(appID: appID)
        }
    }
}

#Preview {
    AboutView()
}
