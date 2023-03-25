//
//  UserVIewModel.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/25.
//

import Foundation
import Metal


class UserViewModel {
    var user: User
    
    var name: String {
        return user.name 
    }
    
    var image: String {
        return user.image 
    }
    
    var admin: Bool {
        return user.admin 
    }
    
    init(user: User) {
        self.user = user
    }
}
// 只要是User的Array就
extension Array where Element == User {
    var toViewModels: [UserViewModel] { return map { UserViewModel(user: $0) }
    }
}
//extension User {
//    var toViewModel: UserViewModel { return UserViewModel(user: self) }
//}
