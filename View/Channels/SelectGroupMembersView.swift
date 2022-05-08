//
//  SelectGroupMembersView.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/8.
//

import SwiftUI

struct SelectGroupMembersView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //search bar
                SearchBar(text: $searchText, isEditing: .constant(false))
                    .padding()
                
                //selected users view
                SelectedGroupMembersView()
                
                //user list view
                ScrollView {
                    VStack {
                        ForEach((0...10), id: \.self) { _ in
                            SelectableUserCell(selectableUser: SelectableUser(user: MOCK_USER))
                        }
                    }
                }
            }
            .navigationBarItems(leading: cancelButton, trailing: nextButton)
            .navigationTitle("New Group")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    var nextButton: some View {
        NavigationLink {
            Text("create group view")
        } label: {
            Text("Next").bold()
        }


    }
    var cancelButton: some View {
        Button {
            print("dismiss view..")
        } label: {
            Text("Cancel")
        }

    }
}

struct SelectGroupMembersView_Previews: PreviewProvider {
    static var previews: some View {
        SelectGroupMembersView()
    }
}
