//
//  SettingsView.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/14.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self.viewModel = EditProfileViewModel(user)
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {                
                NavigationLink {
                    EditProfileView(viewModel)
                } label: {
                    SettingsHeaderView(user: viewModel.user)
                }
                
                VStack(spacing: 1) {
                    ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                        SettingsCell(viewModel: viewModel)
                    }
                }
                
                Button {
                    AuthViewModel.shared.signout()
                } label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.white)
                }
                Spacer()
            }
        }
    }
}
