//
//  SelectableUserCellViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/8.
//

import SwiftUI

struct SelectableUserCellViewModel {
    let selectableUser: SelectableUser
    
    var profileImageUrl: URL? {
        return URL(string: selectableUser.user.profileImageUrl)
    }
    
    var selectedImageName: String {
        return selectableUser.isSelected ? "checkmark.circle.fill" : "circle"
    }
    
    var selectedImageForegroundColor: Color {
        return selectableUser.isSelected ? .blue : .gray
    }
    
    var username: String {
        return selectableUser.user.username
    }
    
    var fullname: String {
        return selectableUser.user.fullname
    }
}
