//
//  StoreListController.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 7.01.2025.
//

import Foundation

extension StoreListView {
    func loadProfile() {
        let defaults = UserDefaults.standard
        do {
            if let savedData = defaults.data(forKey: "profile") {
                let decodedObject = try JSONDecoder().decode(Profile.self, from: savedData)
                print("Class retrieved successfully: \(decodedObject.name), \(decodedObject.addresses)")
                profile = decodedObject
            } else {
                print("No data found for the key.")
            }
        } catch {
            print("Failed to decode object: \(error)")
        }
    }
}
