//
//  UserInfoPageViewModel.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/26.
//

import Foundation

protocol UserInfoPageViewModelType {
    var userInfo: Observable<UserInfo?> { get }
    func getUserInfo(name: String) 
}

final class UserInfoPageViewModel: UserInfoPageViewModelType {
    let userInfo: Observable<UserInfo?> = Observable(.none)
    let error: Observable<String?> = Observable(.none)
    let repository: UserRepositoryType
    init(repository: UserRepositoryType) {
        self.repository = repository
    }
    func getUserInfo(name: String) {
        let urlString = "https://api.github.com/users/\(name)"
        repository.getUserInfo(urlString: urlString) { result in
            switch result {
            case .success(let value):
                self.userInfo.value = value
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
}



