//
//  ProfilePhotoSelectorView.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/21.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
//    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Button {
                imagePickerPresented.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else {
                    Image("plus_photo")
                        .resizable()
//                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 44)
                        .foregroundColor(.blue)
                }
            }
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                ImagePicker(image: $selectedImage)
            }
            
            Text(profileImage == nil ? "Selecta profile photo" : "Great, tap below to continue")
                .font(.system(size: 20, weight: .semibold))
            
            if let image = selectedImage {
                Button {
                    viewModel.uploadProfileImage(image)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                .padding(.top, 24)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func loadImage() {
        guard let selectImage = selectedImage else { return }
        profileImage = Image(uiImage: selectImage)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
