//
//  ContentView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var order = Siparis()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Kek Türü Seç") {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(Siparis.types.indices, id: \.self) {
                                CakeView(order: order, type: $0)
                                //Text("\(Siparis.types[$0]) \(Siparis.prices[$0], format: .currency(code: "TRY"))")
                            }
                        }
                    }
                    Stepper("Kek sayısı: \(order.quantity)", value: $order.quantity, in: 3...20 )
                }
                Section("Ekstra") {
                    Toggle("Kek için özel eklemeler?", isOn: $order.speacialRequestEnabled.animation())
                    
                    if order.speacialRequestEnabled {
                        Toggle("Ekstra krema ekleyin (\(order.quantity, format: .currency(code: "TRY"))+)", isOn: $order.extraFrosting)
                        Toggle("Ekstra serpme ekleyin (\(Float(order.quantity) / 2, format: .currency(code: "TRY"))+)", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Toplam: \(order.cost, format: .currency(code: "TRY"))") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("KekSepeti🧁")
        }
    }
}

#Preview {
    ContentView()
}
