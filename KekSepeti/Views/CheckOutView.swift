//
//  CheckOutView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI

struct CheckoutView: View {
    
    var order: Siparis
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://www.hackingwithswift.com/samples/img/cupcakes@3x.jpg"), scale: 3)
                Text("Toplam: \(order.cost, format: .currency(code: "TRY"))")
                    .font(.title)
                Button("Sipariş Ver") {
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Sipariş")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Teşekkürler", isPresented: $showingConfirmation) {
            Button("Tamam") { }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order.")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Siparis.self, from: data)
            confirmationMessage = "\(decodedOrder.quantity) x \(Siparis.types[decodedOrder.type].lowercased()) kekler için sipariş alındı!"
            showingConfirmation = true
        } catch {
            print("check out failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckoutView(order: Siparis())
}
