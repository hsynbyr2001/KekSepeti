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
    @State private var leftAtDoor = false
    
    private let paymentTypes = ["Online Kredi Kartı", "Kapıda Kredi Kartı", "Nakit", "Yemek Kartları"]
    @State private var paymentType = 0
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    AsyncImage(url: URL(string: "https://www.hackingwithswift.com/samples/img/cupcakes@3x.jpg"), scale: 3)
                        .frame(height: 60)
                    ProductView(order: order)
                }
                Section("Teslimat Bilgileri") {
                    Text("Teslim Alan: \(order.name)")
                    Text("Adres: \(order.streetAddress), \(order.city), \(order.zip)")
                    Toggle("Kapıya Bırak", isOn: $leftAtDoor)
                }
                Section("Ödeme Yöntemi") {
                    Picker("Ödeme Yöntemi", selection: $paymentType) {
                        ForEach(paymentTypes.indices, id: \.self) {
                            Text(paymentTypes[$0])
                        }
                    }
                }
                Section("Tutar") {
                    Text("\(order.cost, format: .currency(code: "TRY"))")
                        .font(.title)
                }
                Section {
                    Button("Sipariş Ver") {
                        Task {
                            await placeOrder()
                        }
                    }
                }
                
            }
            .navigationTitle("Sipariş Özeti")
            .scrollBounceBehavior(.basedOnSize)
            .alert("Teşekkürler", isPresented: $showingConfirmation) {
                Button("Tamam") { }
            } message: {
                Text(confirmationMessage)
            }
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
