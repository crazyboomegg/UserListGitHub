//
//  UserListViewModel.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/25.
//

import Foundation

protocol UserListViewModelType {
    var userList: Observable<[User]> { get }
    func getUserList()
}

class UserListViewModel: UserListViewModelType {
    let userList: Observable<[User]> = Observable([])
    func getUserList() {
        let urlString = "https://api.github.com/users?since=0&per_page=100"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsondata = try decoder.decode([UserDataModel].self, from: data)
                // toViewModels是[User] 的擴充,分離UserListViewModel的formating職責
                self.userList.value = jsondata.toViewModels
            } catch let error {
       
            }
        }.resume()
    }
}
