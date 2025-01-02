//
//  UsersView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 1.01.2025.
//

import SwiftUI

struct UsersView: View {
    
    @State var users: [User] = []
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(users, id: \.self.id) { user in
                    UserCellView(user: user)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top)
        .onAppear {
            fetchUsers()
        }
    }
    
    func fetchUsers() {
        guard let url = URL(string: "https://randomuser.me/api?inc=name,picture&nat=tr&results=10") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                DispatchQueue.main.async {
                    self.users = decodedResponse.results
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

#Preview {
    UsersView()
}
