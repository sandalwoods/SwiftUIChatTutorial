//
//  Channel.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/9.
//

import FirebaseFirestoreSwift

struct Channel: Identifiable, Decodable {
    @DocumentID var id: String?
    let name: String
    let imageUrl: String?
    let uids: [String]
    var lastMessage: String
}


