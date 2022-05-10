//
//  MessageView.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/16.
//

import SwiftUI
import Kingfisher

enum MessageViewConfig {
    case privateMessage
    case groupMessage
}

struct MessageView: View {
    let viewModel: MessageViewModel
    let config: MessageViewConfig
    
    var body: some View {
        HStack {
            if viewModel.isFromCurrentUser {
                Spacer()
                
                Text(viewModel.message.text)
                    .padding(12)
                    .background(Color.blue)
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.leading, 80)
                    .padding(.horizontal)
                
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    if config == .groupMessage {
                        Text(viewModel.message.user?.fullname ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                            .padding(.leading, 56)
                    }
                    HStack(alignment: .bottom) {
                        KFImage(viewModel.profileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                        
                        Text(viewModel.message.text)
                            .padding(12)
                            .background(Color(.systemGray5))
                            .font(.system(size: 15))
                            .clipShape(ChatBubble(isFromCurrentUser: false))
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    .padding(.trailing, 80)
                }
                
                Spacer()
            }
        }
    }
}
