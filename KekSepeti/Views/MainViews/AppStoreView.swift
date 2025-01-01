//
//  SwiftUIView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 1.01.2025.
//

import SwiftUI
import StoreKit

struct AppStoreView: UIViewControllerRepresentable {
    let appID: String

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let storeViewController = SKStoreProductViewController()
        storeViewController.delegate = context.coordinator

        // Load the App Store product page
        let parameters = [SKStoreProductParameterITunesItemIdentifier: appID]
        storeViewController.loadProduct(withParameters: parameters) { success, error in
            if let error = error {
                print("Error loading App Store page: \(error.localizedDescription)")
            }
        }

        // Present SKStoreProductViewController modally
        DispatchQueue.main.async {
            viewController.present(storeViewController, animated: true)
        }

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, SKStoreProductViewControllerDelegate {
        func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
            viewController.dismiss(animated: true)
        }
    }
}
