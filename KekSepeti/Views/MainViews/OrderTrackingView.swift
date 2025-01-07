//
//  OrderTrackingView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 31.12.2024.
//

import SwiftUI

struct OrderTrackingView: View {
    
    var profile: Profile
    
    @State var orderStatus: OrderStatus = .preparing
    @State var orderStatusText = "🧁 Siparişiniz Hazırlanıyor"
    @State var timeRemainingForPreparing: Float = 0
    @State var timeRemainingForDelivery: Float = 0
    @State var countDownTimer: Timer?
    @State var animationTimer: Timer?
    @State var showText = false
    
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
}

#Preview {
    OrderTrackingView(profile: Profile())
}
