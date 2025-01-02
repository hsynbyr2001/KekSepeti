//
//  RatingView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 2.01.2025.
//

import SwiftUI

struct RatingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var review = ""
    @State private var rating = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section("Sipariş nasıldı?") {
                    TextField("Değerlendirme yaz.", text: $review)
                }
                Section("Puanla") {
                    Picker("Puanla", selection: $rating) {
                        ForEach(0..<6) {
                            Text("\($0)")
                        }
                    }
                        .labelsHidden()
                }
                NavigationLink("Gönder", destination: AboutView())
                    .disabled(review == "" ? true : false)
            }
            .navigationTitle("Değerlendirme")
        }
    }
}

#Preview {
    RatingView()
}
