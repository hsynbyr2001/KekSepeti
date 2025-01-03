//
//  OrderTrackingView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 31.12.2024.
//

import SwiftUI

struct OrderTrackingView: View {
    
    var profile: Profile
    
    @State private var orderStatus: OrderStatus = .preparing
    @State private var timeRemainingForPreparing: Float = 0
    @State private var timeRemainingForDelivery: Float = 0
    @State var showText = false
    @State private var orderStatusText = "🧁 Siparişiniz Hazırlanıyor"
    
    enum OrderStatus {
        case preparing
        case delivering
        case delivered
    }
    
    var body: some View {
        AddressMapView()
        NavigationStack {
            HStack {
                ProgressView(value: timeRemainingForPreparing, total: 20)
                ProgressView(value: timeRemainingForDelivery, total: 20)
            }
            .padding([.bottom, .leading, .trailing])
            Text(orderStatusText)
                .font(.title)
                .bold()
                .opacity(showText ? 1 : 0)
            
            if orderStatus == .delivered {
                NavigationLink(destination: RatingView()){
                    Text("Değerlendir")
                        .padding(10)
                        .background(.secondary)
                        .clipShape(.rect(cornerRadius: 10))
                        
                }
            }
        }
        .frame(height: 160)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            if orderStatus != .delivered {
                startTimer()
            }
        }
    }
    
    @State private var countDownTimer: Timer?
    @State private var animationTimer: Timer?
    
    func startTimer() {
        countDownTimer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { timer in
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
                showText = true
            }
        }
        animationTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 1)) {
                showText.toggle()
            }
        }
    }
}

#Preview {
    OrderTrackingView(profile: Profile())
}
