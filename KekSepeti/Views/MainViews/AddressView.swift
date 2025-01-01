//
//  AddressView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI
import MapKit

struct AddressView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var bucket: Bucket
    @State var profile: Profile
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.015137, longitude: 28.979530),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    var body: some View {
        
        Map(position: $position)
            .frame(height: 300)
        
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
                .onChange(of: profile.city) {
                    setMapPosition()
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
    
    func setMapPosition() {
        
        var lat: CLLocationDegrees = 28.979530
        var long: CLLocationDegrees = 41.015137
        
        switch profile.city {
        case "İstanbul":
            long = 41.015137
            lat = 28.979530
        case "Ankara":
            long = 39.925470
            lat = 32.866277
        case "İzmir":
            long = 38.422401
            lat = 27.150428
        default:
            break
        }
        
        position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: long, longitude: lat),
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        )
    }
}

#Preview {
    AddressView(bucket: Bucket(products: []), profile: Profile())
}

