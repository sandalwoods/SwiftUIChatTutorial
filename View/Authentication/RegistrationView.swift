//
//  RegistrationView.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/14.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            NavigationLink(isActive: $viewModel.didAuthenticateUser) {
                ProfilePhotoSelectorView()
            } label: { }

            VStack(alignment: .leading, spacing: 12) {
                HStack { Spacer() }
                
                Text("Get started.")
                    .font(.largeTitle)
                    .bold()
                
                Text("Create your account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 32) {
                    CustomTextField(imageName: "envelope", placeholderText: "Email", isSecurieField: false, text: $email)
                    
                    CustomTextField(imageName: "person", placeholderText: "User name", isSecurieField: false, text: $username)
                    
                    CustomTextField(imageName: "person", placeholderText: "Full name", isSecurieField: false, text: $fullname)
                    
                    CustomTextField(imageName: "lock", placeholderText: "Password", isSecurieField: true, text: $password)
                }
                .padding([.top, .horizontal], 32)
            }
            .padding(.leading)
            
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 320, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .padding(.top, 24)
            .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
            
            Spacer()
            
            Button {
                mode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an accout?")
                        .font(.system(size: 14))
                    Text("Sign In")
                        .font(.system(size: 13, weight: .semibold))
                }
            }
            .padding(.bottom, 32)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
