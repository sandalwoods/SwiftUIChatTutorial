//
//  ImageUploader.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/5.
//

import Firebase
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error  {
                print("DEBUG: failed to upload image with error: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrlaa = url?.absoluteString else { return }
                completion(imageUrlaa)
            }
        }
    }
}
