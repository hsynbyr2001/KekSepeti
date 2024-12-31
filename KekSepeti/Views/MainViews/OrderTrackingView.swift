//
//  OrderTrackingView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 31.12.2024.
//

import SwiftUI

struct OrderTrackingView: View {
    
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
        NavigationStack {
            HStack {
                ProgressView(value: timeRemainingForPreparing, total: 20)
                ProgressView(value: timeRemainingForDelivery, total: 20)
            }
            .padding()
            Text(orderStatusText)
                .font(.title)
                .bold()
                .opacity(show ? 1 : 0)
            
        }
        .onAppear {
            if orderStatus != .delivered {
                startTimer()
            }
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
}

#Preview {
    OrderTrackingView()
}
