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
    let userList: Observable<[User]> = Observable([])
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

protocol UserRepositoryType {
    func getUserList(urlString: String, completion: @escaping(Result<[User], Error>) -> Void )
}

struct UserRepository: UserRepositoryType {
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

struct UserListRequest: Encodable {
    let since: Int
    let perPage: Int
    enum CodingKeys: String, CodingKey {
        case since
        case perPage = "per_page"
    }
}
