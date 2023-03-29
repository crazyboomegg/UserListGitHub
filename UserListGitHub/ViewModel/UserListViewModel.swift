//
//  UserListViewModel.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/25.
//

import Foundation

protocol UserListViewModelType {
    var userList: Observable<[User]> { get }
    var error: Observable<String?> { get }
    func getUserList()
}

final class UserListViewModel: UserListViewModelType {
    var userList: Observable<[User]> = Observable([])
    let error: Observable<String?> = Observable(.none)
    let repository: UserRepositoryType
    init(repository: UserRepositoryType) {
        self.repository = repository
    }
    func getUserList() {
        let urlString = "https://api.github.com/users?since=0&per_page=100"
        repository.getUserList(urlString: urlString) { result in
            switch result {
            case .success(let value):
                self.userList.value = value
            case .failure(let error):
                self.error.value = error.localizedDescription
                print(error)
            }
        }
    }
}
//protocol APIService {
//    func request<T: Decodable>()  {
//
//    }
//}
