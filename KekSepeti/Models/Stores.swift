//
//  Stores.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 30.12.2024.
//

import Foundation

let stores: [Store] = [
    Store(name: "Keksel Hüseyin", rating: 3.2, address: "Beşiktaş, İstanbul", image: "hüs", products: [
        Cake(type: 10, quantity: 1, desc: "Hindistan cevizinin hafif ve kremsi lezzetiyle hazırlanan bu kek, tatlı bir kaçamak yapmak isteyenler için ideal."),
        Cake(type: 11, quantity: 1, desc: "Böğürtlenin hafif mayhoş tadıyla hazırlanan bu kek, hem taze hem de dondurulmuş meyveyle yapılabilir."),
        Cake(type: 12, quantity: 1, desc: "Ananasın tatlı ve tropikal aromasıyla hazırlanan bu kek, yaz aylarında serinletici bir tatlı alternatifi sunar."),
        Cake(type: 13, quantity: 1, desc: "Limonun ferahlatıcı ve hafif ekşi aromasıyla hazırlanan bu kek, sıcak günlerde hafif bir tatlı arayanlar için idealdir."),
        Cake(type: 14, quantity: 1, desc: "Elmanın tatlı ve tarçınla uyumlu aromasıyla hazırlanan bu kek, özellikle sonbaharda çay saatlerini şenlendirir."),
        Cake(type: 15, quantity: 1, desc: "Antep fıstığının yoğun aromasıyla hazırlanan bu kek, hem rengi hem de lezzetiyle göz doldurur.")
    ]),
    
    Store(name: "Parisien Tuvba'nın Kekleri", rating: 4.9, address: "Zeytinburnu, İstanbul", image: "tuvba", products: [
        Cake(type: 5, quantity: 1, desc: "Çileğin taze ve tatlı aromasıyla dolu bu kek, meyve severler için ideal bir seçenektir. Üzerine çilekli kremayla servis edilebilir."),
        Cake(type: 6, quantity: 1, desc: "Yoğun çikolata aromasıyla hazırlanan bu kek, çikolata tutkunlarının favorisi. Bitter veya sütlü çikolata ekleyerek farklı lezzetler yaratabilirsiniz."),
        Cake(type: 7, quantity: 1, desc: "Doğal tatlılığıyla muz, bu keke yumuşak bir doku ve hoş bir aroma katar. Ceviz veya çikolata parçalarıyla zenginleştirilebilir."),
        Cake(type: 8, quantity: 1, desc: "Portakalın ferahlatıcı aromasıyla dolu bu kek, sabah kahvaltılarında veya hafif bir tatlı olarak tercih edilebilir."),
        Cake(type: 9, quantity: 1, desc: "Egzotik bir tat olan mangolu kek, tropikal bir dokunuş arayanlar için birebirdir. Hindistan ceviziyle harika bir ikili oluşturur.")
    ]),
    
    Store(name: "Pelin'in Kek Dünyası", rating: 4.3, address: "Nişantaşı, İstanbul", image: "pelin", products: [
        Cake(type: 0, quantity: 1, desc: "Klasik bir tat olan vanilyalı kek, yumuşak dokusu ve hafif aromasıyla her zevke hitap eder. Çay ve kahve yanında mükemmeldir."),
        Cake(type: 1, quantity: 1, desc: "Tarçının sıcak ve baharatlı aromasıyla hazırlanan bu kek, özellikle soğuk havalarda içinizi ısıtır. Elma veya cevizle harika bir uyum sağlar."),
        Cake(type: 2, quantity: 1, desc: "Rengârenk katmanlarıyla hem göze hem damağa hitap eden bu kek, doğum günleri ve özel kutlamalar için idealdir."),
        Cake(type: 3, quantity: 1, desc: "Tatlı-ekşi vişnelerin leziz aromasıyla hazırlanan kek, hafif ve ferah bir tat sunar. Çikolatalı sosla servis edebilirsiniz."),
        Cake(type: 4, quantity: 1, desc: "Fındığın yoğun lezzetiyle zenginleşen bu kek, çıtır dokusuyla çay saatlerinin vazgeçilmezidir.")
    ]),
]
