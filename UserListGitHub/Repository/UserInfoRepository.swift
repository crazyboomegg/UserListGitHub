//
//  UserInfoRepository.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/30.
//

import Foundation

protocol UserInfoRepositoryType {
    func getUserInfo(urlString: String, completion: @escaping(Result<UserInfo, Error>) -> Void)
}

struct UserInfoRepository: UserInfoRepositoryType {
    func getUserInfo(urlString: String, completion: @escaping(Result<UserInfo, Error>) -> Void) {
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
//                if let jsonString = String(data: data, encoding: .utf8) {
//                           print("JSON String: " + jsonString)
//                       }
                let jsondata = try decoder.decode(UserInfoDataModel.self, from: data)
                
                completion(.success(UserInfo(jsondata)))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}


