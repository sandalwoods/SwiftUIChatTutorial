//
//  EditProfileView.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/15.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @State private var fullname = ""
    @State private var inEditMode = false
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @ObservedObject var viewModel: EditProfileViewModel
    
    var nameChanged: Bool {
        return viewModel.user.fullname != fullname
    }
    
    init(_ viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
        self._fullname = State(initialValue: viewModel.user.fullname)
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                VStack {
                    HStack(alignment: .center) {
                        VStack(alignment: .center) {
                            //photo /edit button
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            } else {
                                KFImage(URL(string: viewModel.user.profileImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            }
                            
                            Button {
                                showImagePicker.toggle()
                            } label: {
                                Text("Edit")
                                    .padding(.leading, 2)
                            }
                            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                                ImagePicker(image: $selectedImage)
                            }
                        }                        
                        .padding()
                        
                        Text("Enter your name or change your profile photo")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding([.bottom, .horizontal])
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color.white)
                    
                    Divider().padding(.horizontal)

                    TextField("", text: $fullname) { _ in
                        self.inEditMode = true
                    }
                    .padding(8)
                    .background(Color.white)
                    
                    Divider().padding(.horizontal)
                }
                .background(Color.white)
                
                VStack(alignment: .leading) {
                    Text("Status")
                        .padding()
                        .foregroundColor(.gray)
                    
                    NavigationLink {
                      StatusSelectorView(viewModel)
                    } label: {
                        HStack {
                            Text(viewModel.user.status.title)
                                .frame(height: 50)
                                .padding(.leading)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                        .background(Color.white)
                    }
                }
                .padding(.top, 44)
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
        .navigationBarItems(leading: inEditMode ? cancelButton : nil, trailing: inEditMode || selectedImage != nil ? doneButton : nil)
    }
    
    var doneButton: some View {
        Button {
            UIApplication.shared.endEditing()
            inEditMode = false
            
            if nameChanged {
                viewModel.updateName(fullname)
            }
            if let selectedImage = selectedImage {
                viewModel.updateProfileImage(selectedImage)
            }
            
        } label: {
            Text("Done").bold()
        }

    }
    
    var cancelButton: some View {
        Button {
            UIApplication.shared.endEditing()
        } label: {
            Text("Cancel")
        }
    }
    
    func loadImage() {
        guard let selectImage = selectedImage else { return }
        profileImage = Image(uiImage: selectImage)
    }
}
