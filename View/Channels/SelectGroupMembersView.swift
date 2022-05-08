//
//  SelectGroupMembersView.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/8.
//

import SwiftUI

struct SelectGroupMembersView: View {
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var show: Bool
    @ObservedObject var viewModel = SelectGroupMembersViewModel()
    @Environment(\.presentationMode) private var mode
    
    var body: some View {
        NavigationView {
            VStack {
                //search bar
                SearchBar(text: $searchText, isEditing: $isEditing)
                    .onTapGesture {
                        isEditing.toggle()
                    }
                    .padding()
                
                //selected users view
                if !viewModel.selectedUsers.isEmpty {
                    SelectedGroupMembersView(viewModel: viewModel)
                }
                
                //user list view
                ScrollView {
                    VStack {
                        ForEach(searchText.isEmpty ? viewModel.selectableUsers : viewModel.filteredUsers(searchText)) { selectableUser in
                            Button {
                                viewModel.selectUser(selectableUser, isSelected: !selectableUser.isSelected)
                            } label: {
                                SelectableUserCell(viewModel: SelectableUserCellViewModel(selectableUser: selectableUser))
                            }
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
            CreateChannelView(viewModel.selectableUsers, show: $show)
        } label: {
            Text("Next").bold()
        }


    }
    var cancelButton: some View {
        Button {
            mode.wrappedValue.dismiss()
        } label: {
            Text("Cancel")
        }
    }
}
