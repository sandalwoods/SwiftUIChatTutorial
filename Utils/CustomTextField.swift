//
//  CustomTextField.swift
//  SwiftUIChatTutorial
//
//  Created by Kevin on 2022/4/14.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeholderText: String
    let isSecurieField: Bool
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecurieField {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                }
                
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}
