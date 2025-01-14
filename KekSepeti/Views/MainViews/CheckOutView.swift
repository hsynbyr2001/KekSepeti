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
    var addressIndex: Int
    private let minimumTotal: Float = 1
    @State private var leftAtDoor = false
    @State private var paymentType = 0
    private let paymentTypes = ["Online Kredi Kartı", "Kapıda Kredi Kartı", "Nakit", "Yemek Kartları"]
    
    var body: some View {
        
        let canOrder = NSDecimalNumber(decimal: bucket.allTotal()).floatValue >= minimumTotal ? true : false
        
        NavigationStack{
            Form {
                ForEach(bucket.allProducts().indices, id: \.self) { indexPath in
                    Section {
                        AsyncImage(url: URL(string: "https://www.hackingwithswift.com/samples/img/cupcakes@3x.jpg"), scale: 3)
                            .frame(height: 35)
                        CakeCellView(cake: bucket.product(at: indexPath))
                    }
                }
                Section("Teslimat Bilgileri") {
                    Text("Teslim Alan: \(profile.name)")
                    Text("Adres: \(profile.addresses[addressIndex].area), \(profile.addresses[addressIndex].city), \(profile.addresses[addressIndex].zip)")
                    Toggle("Kapıya Bırak", isOn: $leftAtDoor)
                        .accessibilityIdentifier("LeavePackageButton")
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
                    Text("\(bucket.allTotal(), format: .currency(code: "TRY"))")
                        .font(.title)
                }
                Section {
                    if !canOrder {
                        Text("Sipariş verebilmek için sepetinizin tutarı \(minimumTotal, format: .currency(code: "TRY")) ve üzeri olmalıdır. Daha fazla ürün ekleyin.")
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }
                    NavigationLink("Sipariş Ver") {
                        OrderTrackingView(profile: profile)
                            .toolbar(.hidden, for: .navigationBar)
                    }
                    .accessibilityIdentifier("CheckOutButton")
                    .disabled(!canOrder)
                }
            }
            .accessibilityIdentifier("CheckOutView")
            .navigationTitle("Sipariş Özeti")
            .scrollBounceBehavior(.basedOnSize)
        }
    }
}

#Preview {
    CheckoutView(bucket: Bucket(products: []), profile: Profile(), addressIndex: 0)
}
