//
//  ProfileView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 7.01.2025.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State var profile: Profile
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImageData: Data? = nil
    
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack {
            List {
                if isEditing {
                    if let uiImage = UIImage(data: profile.image) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100)
                            .clipShape(.circle)
                    }
                    PhotosPicker("Resmi Düzenle", selection: $pickerItem, matching: .images)
                    TextField("İsim", text: $profile.name)
                        .accessibilityIdentifier("NameField")
                } else {
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 100)
                                .foregroundColor(.gray)
                            if let uiImage = UIImage(data: profile.image) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100)
                                    .clipShape(.circle)
                            }
                        }
                        Text(profile.name)
                            .font(.title)
                            .bold()
                    }
                    .padding()
                }
            }
            .toolbar {
                Button {
                    withAnimation {
                        isEditing.toggle()
                    }
                } label: {
                    Image(systemName: isEditing ? "checkmark.circle.fill" : "square.and.pencil")
                }
            }
            .onChange(of: pickerItem) {
                Task {
                    if let data = try? await pickerItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            .onChange(of: selectedImageData) {
                if let data = selectedImageData {
                    profile.image = data
                    profile.save()
                } else {
                    print("Error on selected image data")
                }
            }
        }
    }
}

#Preview {
    ProfileView(profile: Profile())
}
