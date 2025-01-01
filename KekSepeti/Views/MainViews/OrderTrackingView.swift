//
//  OrderTrackingView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 31.12.2024.
//

import SwiftUI
import MapKit

struct OrderTrackingView: View {
    
    var profile: Profile
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.015137, longitude: 28.979530),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    enum OrderStatus {
        case preparing
        case delivering
        case delivered
    }
    
    @State private var orderStatus: OrderStatus = .preparing
    @State private var timeRemainingForPreparing: Float = 0
    @State private var timeRemainingForDelivery: Float = 0
    @State var show = false
    
    @State private var orderStatusText = "🧁 Siparişiniz Hazırlanıyor"
    
    var body: some View {
        Map(position: $position)
        NavigationStack {
            HStack {
                ProgressView(value: timeRemainingForPreparing, total: 20)
                ProgressView(value: timeRemainingForDelivery, total: 20)
            }
            .padding([.bottom, .leading, .trailing])
            Text(orderStatusText)
                .font(.title)
                .bold()
                .opacity(show ? 1 : 0)
            
        }
        .frame(height: 160)
        .onAppear {
            if orderStatus != .delivered {
                startTimer()
            }
            setMapPosition()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @State private var countDownTimer: Timer?
    @State private var animationTimer: Timer?
    
    func startTimer() {
        countDownTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            switch orderStatus {
            case .preparing:
                if timeRemainingForPreparing < 19.8 {
                    timeRemainingForPreparing += 0.01
                }
                else {
                    orderStatusText = "🛵 Siparişiniz Yolda!"
                    orderStatus = .delivering
                }
            case .delivering:
                if timeRemainingForDelivery < 19.8 {
                    timeRemainingForDelivery += 0.01
                }
                else {
                    orderStatusText = "✅ Siparişiniz Teslim Edildi!"
                    orderStatus = .delivered
                }
            case .delivered:
                countDownTimer?.invalidate()
                animationTimer?.invalidate()
                show = true
            }
        }
        animationTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 1)) {
                show.toggle()
            }
        }
    }
    
    func setMapPosition() {
        
        var lat: CLLocationDegrees = 41.015137
        var long: CLLocationDegrees = 28.979530
        
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
    OrderTrackingView(profile: Profile())
}
