//
//  SettingsHeaderView.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/14.
//

import SwiftUI

struct SettingsHeaderView: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack {
            Image("cesar.jpg")
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                Text("Available")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
