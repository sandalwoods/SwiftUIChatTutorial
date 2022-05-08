//
//  SelectableUser.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/8.
//

import Foundation

struct SelectableUser: Identifiable {
    let user: User
    var isSelected: Bool = false
    var id: String {
        return user.id ?? NSUUID().uuidString
    }
}
