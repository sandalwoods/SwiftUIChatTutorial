//
//  ChatViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/16.
//

import Firebase

class ChatViewModel: ObservableObject {    
    @Published var messages = [Message]()
    let user: User
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        let query = COLLECTION_MESSAGES.document(currentUid).collection(chatPartnerId).order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var temMessages = changes.compactMap({ try? $0.document.data(as: Message.self) })
            for (index, message) in temMessages.enumerated() where message.fromId != currentUid {
                temMessages[index].user = self.user
            }
            self.messages.append(contentsOf: temMessages)
        }
    }
//    var mockMessages: [Message] {
//        [
//            .init(isFromCurrentUser: true, messageText: "hey what's up man"),
//            .init(isFromCurrentUser: false, messageText: "not much how are you"),
//            .init(isFromCurrentUser: true, messageText: "I'm doing fine, having fun buidling this app"),
//            .init(isFromCurrentUser: true, messageText: "Are you learning alot?"),
//            .init(isFromCurrentUser: false, messageText: "yeah i am love this course"),
//            .init(isFromCurrentUser: true, messageText: "That's awesome, i'm glad i bought it"),
//            .init(isFromCurrentUser: true, messageText: "Talk you later!"),
//        ]
//    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = COLLECTION_MESSAGES.document(chatPartnerId).collection(currentUid)
        let recentCurrentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages").document(chatPartnerId)
        let recentPartnerRef = COLLECTION_MESSAGES.document(chatPartnerId).collection("recent-messages").document(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                                   "fromId": currentUid,
                                   "toId": chatPartnerId,
                                   "read": false,
                                   "timestamp": Timestamp(date: Date())
        ]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
        recentCurrentRef.setData(data)
        recentPartnerRef.setData(data)
    }
}
