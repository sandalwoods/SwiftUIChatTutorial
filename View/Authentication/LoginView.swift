//
//  LoginView.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/14.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    HStack { Spacer() }
                    
                    Text("Hello.")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                    
                    VStack(spacing: 40) {
                        CustomTextField(imageName: "envelope", placeholderText: "Email", isSecurieField: false, text: $email)
                        
                        CustomTextField(imageName: "lock", placeholderText: "Password", isSecurieField: true, text: $password)
                    }
                    .padding([.top, .horizontal], 32)
                }
                .padding(.leading)
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        Text("Reset password...")
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                }
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 320, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an accout?")
                            .font(.system(size: 14))
                        Text("Sign Up")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .padding(.bottom, 32)
                }
            }
        }
        .padding(.top, -56)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
