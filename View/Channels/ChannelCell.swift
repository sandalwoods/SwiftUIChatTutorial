//
//  ChannelCell.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/7.
//

import SwiftUI
import Kingfisher

struct ChannelCell: View {
    let channel: Channel
    
    var body: some View {
        NavigationLink {
            ChannelChatView(channel)
        } label: {
            VStack {
                HStack {
                    if let imageUrl = channel.imageUrl {
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.2.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                    }
            
                    VStack(alignment: .leading, spacing: 4) {
                        Text(channel.name)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text(channel.lastMessage)
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
}
