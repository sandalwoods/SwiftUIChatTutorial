//
//  SelectedGroupMembersView.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/8.
//

import SwiftUI

struct SelectedGroupMembersView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach((0...5), id: \.self) { _ in
                    ZStack(alignment: .topTrailing) {
                        VStack {
                            Image("cesar.jpg")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                            
                            Text("Edidie Brock")
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 64)
                        
                        Button {
                            print("deselected user..")
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                                .padding(4)
                        }
                        .background(Color(.gray))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                    }
                }
            }
        }
        .animation(.spring())
        .padding()
    }
}

struct SelectedGroupMembersView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedGroupMembersView()
    }
}
