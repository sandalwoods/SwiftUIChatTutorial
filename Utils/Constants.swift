//
//  Constants.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/7.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
let COLLECTION_CHANNELS = Firestore.firestore().collection("channels")
