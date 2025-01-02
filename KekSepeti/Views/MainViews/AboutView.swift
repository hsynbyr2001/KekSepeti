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
    
    enum Links {
        case appstore
        case github
        case linkedin
        case instagram
        case youtube
    }
    
    func openLink(type: Links) {
        var appURL = URL(string: "github://")!
        var webURL = URL(string: "https://github.com/hsynbyr2001")!
        
        switch type {
        case .appstore:
            appURL = URL(string: "appstore://")!
            webURL = URL(string: "https://apps.apple.com/tr/app/görev-dünya-uzay-macerası/id6446176412?l=tr")!
        case .github:
            appURL = URL(string: "github://")!
            webURL = URL(string: "https://github.com/hsynbyr2001")!
        case .linkedin:
            appURL = URL(string: "linkedin://")!
            webURL = URL(string: "https://www.linkedin.com/in/hsbyr/")!
        case .instagram:
            appURL = URL(string: "instagram://")!
            webURL = URL(string: "https://www.instagram.com/coderastronaut/")!
        case .youtube:
            appURL = URL(string: "youtube://")!
            webURL = URL(string: "https://www.youtube.com/@HuseyinBayr")!
        }
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    AboutView()
}
