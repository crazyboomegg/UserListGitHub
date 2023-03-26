//
//  UserInfoViewModel.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/26.
//

import Foundation

class UserInfoViewModel {
    var userInfo: UserInfo

        var image: String {
        return userInfo.image ?? ""
        }
 
        var name: String {
            return userInfo.name ?? ""
        }

        var nickName: String {
            return userInfo.nickName ?? ""
        }

        var loginName: String {
            return userInfo.loginName ?? ""
        }
 
        var admin: Bool {
            return userInfo.admin ?? false
        }
        
        var location: String {
            return userInfo.location ?? ""
        }
        
        var link: String {
            return userInfo.link ?? ""
        }
        
        init(userInfo: UserInfo) {
            self.userInfo = userInfo
        }
}
  
extension Array where Element == UserInfo {
    var toViewModels: [UserInfoViewModel] { return map { UserInfoViewModel(userInfo: $0) }
    }
}

