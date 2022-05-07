//
//  Extensions.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/15.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
