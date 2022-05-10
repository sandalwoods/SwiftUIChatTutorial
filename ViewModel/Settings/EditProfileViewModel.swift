//
//  EditProfileViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/10.
//

import UIKit
import Firebase

class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(_ user: User) {
        self.user = user
    }
    
    func updateProfileImage(_ image: UIImage) {
        guard let uid = user.id else { return }
        
        let storagePath = Storage.storage().reference(forURL: user.profileImageUrl)
        
        storagePath.delete { error in
            if let error = error {
                print("DEBUG: failed to delete user image \(error.localizedDescription)")
                return
            }
            
            ImageUploader.uploadImage(image: image) { imageUrl in
                COLLECTION_USERS.document(uid).updateData(["profileImageUrl": imageUrl]) { error in
                    if let error = error {
                        print("DEBUG: failed to update image url \(error.localizedDescription)")
                        return
                    }
                    self.user.profileImageUrl = imageUrl
                }
            }
        }
    }
    
    func updateName(_ name: String) {
        guard let uid = user.id else { return }
        
        COLLECTION_USERS.document(uid).updateData(["fullname": name]) { error in
            if let error = error {
                print("DEBUG: failed to update fullname \(error.localizedDescription)")
                return
            }
            self.user.fullname = name
        }
    }
    
    func updateStatus(_ status: UserStatus) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["status": status.rawValue]) { error in
            if let error = error {
                print("DEBUG: failed to update status \(error.localizedDescription)")
                return
            }
            self.user.status = status
        }
    }
}
