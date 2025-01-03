//
//  AddressMapView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 3.01.2025.
//

import SwiftUI
import MapKit

struct AddressMapView: View {
    
    let locationManager = CLLocationManager()
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        Map(position: $cameraPosition) {
            UserAnnotation()
        }
        .mapControls {
            MapUserLocationButton()
        }
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    AddressMapView()
}
