//
//  AddressView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI

struct NewAddressView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var profile: Profile
    @State var address: Address = Address(area: "", city: "İstanbul", zip: "")
    
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
                TextField("İlçe", text: $address.area)
                    .accessibilityIdentifier("AreaField")
                TextField("Posta Kodu", text: $address.zip)
                    .accessibilityIdentifier("ZipField")
                Picker("Şehir", selection: $address.city) {
                    ForEach(address.cities, id: \.self) {
                        Text("\($0)").tag("\($0)")
                    }
                }
                .accessibilityIdentifier("CityPicker")
            }
            Section {
                Button("Adresi Kaydet", action: {
                    profile.addresses.append(address)
                    saveProfile()
                    print(profile.addresses)
                    dismiss()
                })
            }
            .disabled(!address.hasValidAddress)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            address.city = address.cities[0]
        }
    }
    
    func saveProfile() {
        let defaults = UserDefaults.standard
        
        do {
            let encodedData = try JSONEncoder().encode(profile)
            defaults.set(encodedData, forKey: "profile")
            print("Profile saved successfully!")
        } catch {
            print("Failed to encode and save object: \(error)")
        }
    }
}

#Preview {
    NewAddressView(profile: Profile())
}

