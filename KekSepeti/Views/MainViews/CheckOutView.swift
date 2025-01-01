//
//  CheckOutView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 29.12.2024.
//

import SwiftUI

struct CheckoutView: View {
    
    var bucket: Bucket
    var profile: Profile
    
    @State private var leftAtDoor = false
    
    private let paymentTypes = ["Online Kredi Kartı", "Kapıda Kredi Kartı", "Nakit", "Yemek Kartları"]
    @State private var paymentType = 0
    
    private let minimumTotal: Float = 200
    
    var body: some View {
        
        var canOrder = NSDecimalNumber(decimal: bucket.total).floatValue >= minimumTotal ? true : false
        
        NavigationStack{
            Form {
                ForEach(bucket.products.indices, id: \.self) { indexPath in
                    Section {
                        AsyncImage(url: URL(string: "https://www.hackingwithswift.com/samples/img/cupcakes@3x.jpg"), scale: 3)
                            .frame(height: 35)
                        CakeCellView(cake: bucket.products[indexPath])
                    }
                }
                Section("Teslimat Bilgileri") {
                    Text("Teslim Alan: \(profile.name)")
                    Text("Adres: \(profile.area), \(profile.city), \(profile.zip)")
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
                    Text("Minimum Sipariş Tutarı: \(minimumTotal, format: .currency(code: "TRY"))")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .padding(0)
                    Text("\(bucket.total, format: .currency(code: "TRY"))")
                        .font(.title)
                    
                }
                Section {
                    if !canOrder {
                        Text("Sipariş verebilmek için sepetinizin tutarı \(minimumTotal, format: .currency(code: "TRY")) ve üzeri olmalıdır. Daha fazla ürün ekleyin.")
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }
                    NavigationLink("Sipariş Ver") {
                        OrderTrackingView()
                    }
                    .disabled(!canOrder)
                }
            }
            .onAppear {
                let defaults = UserDefaults.standard
                
                if profile.isRememberMeOn {
                    do {
                        let encodedData = try JSONEncoder().encode(profile)
                        defaults.set(encodedData, forKey: "profile")
                        print("Profile saved successfully!")
                    } catch {
                        print("Failed to encode and save object: \(error)")
                    }
                } else {
                    defaults.removeObject(forKey: "profile")
                }
            }
            .navigationTitle("Sipariş Özeti")
            .scrollBounceBehavior(.basedOnSize)
        }
    }
}

#Preview {
    CheckoutView(bucket: Bucket(products: []), profile: Profile())
}
