//
//  MessageViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/7.
//

import Foundation

class MessageViewModel: ObservableObject {
    @Published var user: User?
    let message: Message
    
    init(_ message: Message) {
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil }
        return URL(string: profileImageUrl)
    }
    
    var chatPartnerId: String {
        return message.fromId == currentUid ? message.toId : message.fromId
    }
    
    func fetchUser() {
        
    }
}
