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
    var fullname: String
    let email: String
    var profileImageUrl: String
    var status: UserStatus
}

let MOCK_USER = User(id: "1234567", username: "test", fullname: "test", email: "test@gmail.com", profileImageUrl: "www.google.com", status: .available)
