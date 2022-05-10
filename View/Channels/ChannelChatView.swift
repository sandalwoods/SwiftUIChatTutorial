//
//  ChannelChatView.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/9.
//

import SwiftUI

struct ChannelChatView: View {
    @ObservedObject var viewModel: ChannelChatViewModel
    @State private var messageText = ""
    
    init(_ channel: Channel) {
        self.viewModel = ChannelChatViewModel(channel)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                //messages
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(viewModel: MessageViewModel(message), config: .groupMessage)
                    }
                }
            }
            // input view
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle(viewModel.channel.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendChannelMessage(messageText: messageText)
        messageText = ""
    }
}
