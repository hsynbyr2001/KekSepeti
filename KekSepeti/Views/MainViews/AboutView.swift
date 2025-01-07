//
//  AboutView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 1.01.2025.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        Image("hüs")
            .resizable()
            .frame(width: 70, height: 70)
            .clipShape(.circle)
        Text("Hüseyin Bayır")
            .font(.title)
        Text("iOS Developer")
            .font(.footnote)
            .padding(.bottom)
        HStack {
            Button("App Store", action: {
                openLink(type: .appstore)
            })
            .buttonStyle(.borderedProminent)
            Button("GitHub", action: {
                openLink(type: .github)
            })
            .buttonStyle(.borderedProminent)
        }
        HStack {
            Button("Instagram", action: {
                openLink(type: .instagram)
            })
            .buttonStyle(.borderedProminent)
            Button("LinkedIn", action: {
                openLink(type: .linkedin)
            })
            .buttonStyle(.borderedProminent)
        }
        Button("Youtube", action: {
            openLink(type: .youtube)
        })
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    AboutView()
}
