//
//  UserVIewModel.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/25.
//
final class User {
    var user: UserDataModel

    var name: String {
       return user.name
    }

    var image: String {
       return user.image
    }

    var admin: Bool {
       return user.admin
    }

    init(user: UserDataModel) {
        self.user = user
    }
}
// 只要是User的Array就
extension Array where Element == UserDataModel {
    var toViewModels: [User] { return map { User(user: $0) }
    }
}
