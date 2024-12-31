//
//  AddressView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI

struct AddressView: View {
    
    @State var bucket: Bucket
    @State var profile: Profile
    
    var body: some View {
        Form {
            Section("Teslimat bilgileri") {
                TextField("İsim", text: $profile.name)
                TextField("İlçe", text: $profile.area)
                TextField("Şehir", text: $profile.city)
                TextField("Posta Kodu", text: $profile.zip)
            }
            Section("Beni hatırla") {
                Toggle("Bilgiler kayıtlı kalsın mı?", isOn: $profile.isRememberMeOn)
            }
            .disabled(!profile.hasValidAddress)
            Section {
                NavigationLink("Adresi Onayla") {
                    CheckoutView(bucket: bucket, profile: profile)
                }
            }
            .disabled(!profile.hasValidAddress)
        }
        .navigationTitle("Sipariş Detayları")
    }
}

#Preview {
    AddressView(bucket: Bucket(products: []), profile: Profile())
}

