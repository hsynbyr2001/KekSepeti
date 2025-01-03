//
//  AddressView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI

struct AddressView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var bucket: Bucket
    @State var profile: Profile
    
    var body: some View {
        AddressMapView()
        Form {
            Section {
                Button {
                    dismiss()
                } label: {
                    Text("Geri")
                }
            }
            Section("Teslimat bilgileri") {
                TextField("İsim", text: $profile.name)
                TextField("İlçe", text: $profile.area)
                Picker("Şehir", selection: $profile.city) {
                    ForEach(profile.cities, id: \.self) {
                        Text("\($0)")
                    }
                }
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddressView(bucket: Bucket(products: []), profile: Profile())
}

