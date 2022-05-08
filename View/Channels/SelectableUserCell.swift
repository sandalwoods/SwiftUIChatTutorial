//
//  SelectableUserCell.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/8.
//

import SwiftUI
import Kingfisher

struct SelectableUserCell: View {
    let viewModel: SelectableUserCellViewModel
    
    var body: some View {
        VStack {
            HStack {
                KFImage(viewModel.profileImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.username)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(viewModel.fullname)
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: viewModel.selectedImageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(viewModel.selectedImageForegroundColor)
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
}
