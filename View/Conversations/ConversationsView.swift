//
//  ConversationsView.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/14.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showNewMesageView = false
    @State private var showChatView = false
    @State var selectedUser: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let user = selectedUser {
                NavigationLink(destination: ChatView(user: user),
                               isActive: $showChatView,
                               label: { })
            }
           
            //chats
            ScrollView {
                VStack(alignment: .leading) {                
                    ForEach(viewModel.recentMessages) { message in
                        ConversationCell(viewModel: ConversationCellViewModel(message))
                    }
                }
            }
            
            //floating button
            FloatingButton(show: $showNewMesageView)
                .sheet(isPresented: $showNewMesageView) {
                    NewMessageView(showChatView: $showChatView, user: $selectedUser)
                }
        }
        .onAppear {
            viewModel.fetchRecentMessages()
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
