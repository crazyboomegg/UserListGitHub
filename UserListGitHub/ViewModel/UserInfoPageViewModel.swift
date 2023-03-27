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

    func getUserInfo(name: String) {
        let urlString = "https://api.github.com/users/\(name)"
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
                if let jsonString = String(data: data, encoding: .utf8) {
                           print("JSON String: " + jsonString)
                       }
                let jsondata = try decoder.decode(UserInfoDataModel.self, from: data)
                // toViewModels是[User] 的擴充,分離UserListViewModel的formating職責
                self.userInfo.value = UserInfo(jsondata)
                print("RRRR" + "\(jsondata)")
            } catch let error {
                print("GGGG" + "\(error)")
            }
        }.resume()
    }
}

