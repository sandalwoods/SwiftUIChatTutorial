//
//  ChannelChatViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/9.
//

import Firebase

class ChannelChatViewModel: ObservableObject {
    let channel: Channel
    @Published var messages = [Message]()
    
    init(_ channel: Channel) {
        self.channel = channel
        fetchChannelMessages()
    }
    
    func fetchChannelMessages() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let channelId = channel.id else { return }
        
        let query = COLLECTION_CHANNELS.document(channelId).collection("messages").order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            let tempMessages = changes.compactMap({ try? $0.document.data(as: Message.self) })
            
            for (index, message) in tempMessages.enumerated() where message.fromId != currentUid {
                self.fetchUser(withUid: message.fromId) { user in
                    self.messages[index].user = user
                }
            }
            self.messages.append(contentsOf: tempMessages)
        }
    }
    
    func sendChannelMessage(messageText: String) {
        guard let currentUser = AuthViewModel.shared.currentUser else { return }
        guard let currentUid = currentUser.id else { return }
        guard let channelId = channel.id else { return }
        
        let data: [String: Any] = ["fromId": currentUid,
                                   "toId": channelId,
                                   "read": false,
                                   "text": messageText,
                                   "timestamp": Timestamp(date: Date())]
        COLLECTION_CHANNELS.document(channelId).collection("messages").document().setData(data)
        COLLECTION_CHANNELS.document(channelId).updateData(["lastMessage": "\(currentUser.username): \(messageText)"])
    }
    
    private func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
}
