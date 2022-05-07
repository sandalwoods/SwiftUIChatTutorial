//
//  User.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/5.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}

let MOCK_USER = User(id: "1234567", username: "test", fullname: "test", email: "test@gmail.com", profileImageUrl: "www.google.com")
