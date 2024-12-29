//
//  AddressView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI

struct AddressView: View {
    
    @Bindable var order: Siparis
    
    var body: some View {
        Form {
            Section {
                TextField("İsim", text: $order.name)
                TextField("Sokak", text: $order.streetAddress)
                TextField("Şehit", text: $order.city)
                TextField("Posta Kodu", text: $order.zip)
            }
            
            Section {
                NavigationLink("Ödeme") {
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Sipariş Detayları")
    }
}

#Preview {
    AddressView(order: Siparis())
}

