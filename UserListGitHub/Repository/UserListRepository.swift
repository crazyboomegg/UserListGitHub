//
//  UserListRepository.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/29.
//

import Foundation

protocol UserListRepositoryType {
    func getUserList(urlString: String, completion: @escaping(Result<[User], Error>) -> Void )
}

struct UserListRepository: UserListRepositoryType {
    func getUserList(urlString: String, completion: @escaping(Result<[User], Error>) -> Void ) {
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
                completion(.success(jsondata.toViewModels))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}

