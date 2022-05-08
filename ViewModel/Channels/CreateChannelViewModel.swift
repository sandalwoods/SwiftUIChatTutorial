//
//  CreateChannelViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/8.
//

import UIKit

class CreateChannelViewModel: ObservableObject {
    @Published var didCreateChannel = false
    let users: [User]
    
    init(_ selectableUsers: [SelectableUser]) {
        self.users = selectableUsers.map({ $0.user })
    }
    
    func createChannel(name: String, image: UIImage?) {
        guard let currentUser = AuthViewModel.shared.currentUser else { return }
        guard let currentUid = currentUser.id else { return }
        
        var uids = users.compactMap({ $0.id })
        uids.append(currentUid)
        
        var data: [String: Any] = ["name": name,
                                   "uids": uids,
                                   "lastMessage": "\(currentUser.fullname) created a channel"]
        
        if let image = image {
            ImageUploader.uploadImage(image: image) { imageUrl in
                data["imageUrl"] = imageUrl
            }
        }
        COLLECTION_CHANNELS.document().setData(data) { _ in
            print("DEBUG: did upload channel")
            self.didCreateChannel = true
        }
    }
}
