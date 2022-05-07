//
//  UserCell.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/15.
//

import SwiftUI

struct ConversationCell: View {
    let viewModel: MessageViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image("cesar.jpg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Eddie Brock")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(viewModel.message.text)
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
            
            Divider()
        }
        .padding(.top)
    }
}
