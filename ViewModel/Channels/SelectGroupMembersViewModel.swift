//
//  SelectGroupMembersViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by kevin on 2022/5/8.
//

import Firebase

class SelectGroupMembersViewModel: ObservableObject {
    @Published var selectableUsers = [SelectableUser]()
    @Published var selectedUsers = [SelectableUser]()
    
    init() {
        fetchUsers()
    }
    
    //fetch users
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            let users = documents.compactMap({ try? $0.data(as: User.self) }).filter({ $0.id != Auth.auth().currentUser?.uid})
            
            self.selectableUsers = users.map({ SelectableUser(user: $0) })
        }
    }
    
    //select/deselect users
    func selectUser(_ user: SelectableUser, isSelected: Bool) {
        guard let index = selectableUsers.firstIndex(where: { $0.id == user.id }) else { return }
        selectableUsers[index].isSelected = isSelected
        
        if isSelected {
            selectedUsers.append(selectableUsers[index])
        } else {
            selectedUsers.removeAll(where: { $0.id == user.id})
        }
    }
    
    //filter users for search
    func filteredUsers(_ query: String) -> [SelectableUser] {
        let lowercaseQuery = query.lowercased()
        
        return selectableUsers.filter({
            $0.user.fullname.lowercased().contains(lowercaseQuery) || $0.user.username.contains(lowercaseQuery)
        })
    }
}
