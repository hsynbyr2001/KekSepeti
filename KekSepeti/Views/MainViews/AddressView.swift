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
                    .accessibilityIdentifier("NameField")
                TextField("İlçe", text: $profile.area)
                    .accessibilityIdentifier("AreaField")
                Picker("Şehir", selection: $profile.city) {
                    ForEach(profile.cities, id: \.self) {
                        Text("\($0)").tag("\($0)")
                    }
                }
                .accessibilityIdentifier("CityPicker")
                TextField("Posta Kodu", text: $profile.zip)
                    .accessibilityIdentifier("ZipField")
            }
            Section("Beni hatırla") {
                Toggle("Bilgiler kayıtlı kalsın mı?", isOn: $profile.isRememberMeOn)
                    .accessibilityIdentifier("RememberMeButton")
            }
            .disabled(!profile.hasValidAddress)
            Section {
                NavigationLink("Adresi Onayla") {
                    CheckoutView(bucket: bucket, profile: profile)
                }
                .accessibilityIdentifier("ConfirmAddress")
            }
            .disabled(!profile.hasValidAddress)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            profile.city = profile.cities[0]
        }
    }
}

#Preview {
    AddressView(bucket: Bucket(products: []), profile: Profile())
}

