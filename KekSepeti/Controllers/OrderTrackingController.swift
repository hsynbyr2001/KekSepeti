//
//  OrderTrackingController.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 7.01.2025.
//

import SwiftUI

extension OrderTrackingView {
    
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
