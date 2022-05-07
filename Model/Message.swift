//
//  Message.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/16.
//

import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}
