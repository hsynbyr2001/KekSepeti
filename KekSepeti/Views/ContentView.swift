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
                Section {
                    Picker("Kek türü seçin",  selection: $order.type) {
                        ForEach(Siparis.types.indices, id: \.self) {
                            Text(Siparis.types[$0])
                        }
                    }
                    
                    Stepper("Kek sayısı: \(order.quantity)", value: $order.quantity, in: 3...20 )
                }
                
                Section {
                    Toggle("Kek için özel eklemeler?", isOn: $order.speacialRequestEnabled.animation())
                    
                    if order.speacialRequestEnabled {
                        Toggle("Ekstra krema ekleyin", isOn: $order.extraFrosting)
                        Toggle("Ekstra serpme ekleyin", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Teslimat Bilgileri") {
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
