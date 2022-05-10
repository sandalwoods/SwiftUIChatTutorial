//
//  SettingsCellViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/15.
//

import SwiftUI

enum SettingsCellViewModel: Int, CaseIterable {
    case account
    case notfications
    case starredMessages
    
    var title: String {
        switch self {
        case .account: return "Account"
        case .notfications: return "Notifications"
        case .starredMessages: return "Starred Messages"
        }
    }
    
    var imageName: String {
        switch self {
        case .account: return "key.fill"
        case .notfications: return "bell.badge.fill"
        case .starredMessages: return "star.fill"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .account: return .blue
        case .notfications: return .red
        case .starredMessages: return .yellow
        }
    }
}
