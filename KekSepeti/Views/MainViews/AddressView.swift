//
//  AddressView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI
import PhotosUI

struct AddressView: View {
    @State var bucket: Bucket
    @State var profile: Profile
    
    var body: some View {
        NavigationStack {
            List {
                Section("Profil") {
                    NavigationLink(destination: ProfileView(profile: profile)) {
                        if profile.name.isEmpty {
                            ContentUnavailableView {
                                Label("Profil yok", systemImage: "exclamationmark.bubble.fill")
                            } description: {
                                Text("Yeni bir profil oluştur")
                            }
                        } else {
                            HStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 100)
                                        .foregroundColor(.gray)
                                    if let uiImage = UIImage(data: profile.image) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100)
                                            .clipShape(.circle)
                                    }
                                }
                                Text(profile.name)
                                    .font(.title)
                                    .bold()
                            }
                            .padding()
                        }
                    }
                }
                Section("Kayıtlı Adreslerim") {
                    if !profile.addresses.isEmpty {
                        ForEach(profile.addresses.indices, id: \.self) { indexPath in
                            NavigationLink("\(profile.addresses[indexPath].area), \(profile.addresses[indexPath].city), \(profile.addresses[indexPath].zip)", destination: CheckoutView(bucket: bucket, profile: profile, addressIndex: indexPath))
                                .accessibilityIdentifier("SelectAddress")
                                .disabled(profile.name.isEmpty)
                        }
                    } else {
                        ContentUnavailableView {
                            Label("Adres yok", systemImage: "exclamationmark.bubble.fill")
                        } description: {
                            Text("Yeni bir adres ekle")
                        }
                    }
                }
                Section("Yeni oluştur") {
                    NavigationLink("Yeni Adres Ekle", destination: NewAddressView(profile: profile))
                        .accessibilityIdentifier("NewAddressButton")
                }
            }
        }
        .navigationTitle("Adreslerim")
    }
}

#Preview {
    AddressView(bucket: Bucket(products: []), profile: Profile())
}
