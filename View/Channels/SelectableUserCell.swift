//
//  SelectableUserCell.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/8.
//

import SwiftUI

struct SelectableUserCell: View {
    let selectableUser: SelectableUser
    
    var body: some View {
        VStack {
            HStack {
                Image("cesar.jpg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(selectableUser.user.username)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(selectableUser.user.fullname)
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: selectableUser.isSelected ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(selectableUser.isSelected ? .blue : .gray)
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
}

struct SelectableUserCell_Previews: PreviewProvider {
    static var previews: some View {
        SelectableUserCell(selectableUser: SelectableUser(user: MOCK_USER))
    }
}
