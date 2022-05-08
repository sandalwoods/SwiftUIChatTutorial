//
//  ChannelCell.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/7.
//

import SwiftUI

struct ChannelCell: View {
    var body: some View {
        NavigationLink {
            Text("channel chat view")
        } label: {
            VStack {
                HStack {
                    Image(systemName: "person.2.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Gotham city")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("Bruce Wayne: hello")
                            .font(.system(size: 15))
                    }
                    .foregroundColor(.black)
                    Spacer()
                }
                .padding(.horizontal)
                
                Divider()
            }
            .padding(.top)
        }
        
    }
}

struct ChannelCell_Previews: PreviewProvider {
    static var previews: some View {
        ChannelCell()
    }
}
