//
//  UserCellView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 1.01.2025.
//

import SwiftUI

struct UserCellView: View {
    
    var user: User
    
    // İsim soyisim
    // Puan
    // Değerlendirme
    // Tarih
    
    private let ratings: [String: String] = [
        "Çikolatalı": "Çikolatalı pastaları tek kelimeyle harika! Her lokmada tazelik ve kalite hissediliyor.",
        "Cupcakeler": "Cupcake’ler hem göze hem damağa hitap ediyor. Özellikle vanilyalı olanı çok sevdim.",
        "Limonlu": "Limonlu çeşitleri gerçekten çok başarılı. Gerçekten favorim oldu.",
        "Fiyat uygun": "Porsiyonlar oldukça doyurucu ve lezzetli. Fiyatları da kaliteye göre çok makul.",
        "Yumuşacık": "Keklerin dokusu yumuşacık, malzemelerin kalitesi ilk ısırıkta hissediliyor.",
        "Doğum günü": "Doğum günü pastası sipariş ettim; hem tasarımı hem de tadı mükemmeldi.",
        "Çikolatalısı": "Tatlı krizine birebir! Özellikle çikolatalı olan efsane.",
        "Taze": "Tartlar tam kıvamında ve meyveler çok taze. Herkese tavsiye ederim.",
        "Hafif": "Pastanın kreması hafif ve lezzetliydi, asla ağır gelmedi. Çok beğendim.",
        "Glutensiz": "Glutensiz seçenekleri bekliyorum, diğerleri lezzetten hiçbir şey kaybetmemiş. Harika!"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            let randomRating = ratings.randomElement()
            Text(randomRating?.key ?? "Hata")
                .font(.headline)
            
            Text(randomRating?.value ?? "Değerlendirme yüklenemedi.")
            HStack {
                AsyncImage(url: URL(string: user.picture.thumbnail)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 30, height: 30)
                        .clipShape(.circle)
                VStack(alignment: .leading) {
                    Text("\(user.name.first) \(user.name.last)")
                    Text("\(Date.now.addingTimeInterval(TimeInterval.random(in: -200000000 ... -10)), format: .dateTime)")
                        .font(.footnote)
                }
            }
        }
        .frame(maxWidth: 300, maxHeight: 150)
        .padding(22)
        .background(.secondary.opacity(0.2))
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    UserCellView(user: User(name: User.Name(title: "Bay", first: "Hüseyin", last: "Bayır"), picture: User.Picture(large: "https://randomuser.me/api/portraits/thumb/men/12.jpg", medium: "https://randomuser.me/api/portraits/thumb/men/12.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/12.jpg") ))
}
