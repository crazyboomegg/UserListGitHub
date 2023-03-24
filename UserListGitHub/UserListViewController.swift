//
//  ViewController.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/24.
//

import UIKit

class UserListViewController: UIViewController {
    let viewModel: UserListViewModelType
    init(_ viewModel: UserListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        bind(to: viewModel)
        viewModel.getUserList()
    }
    private func bind(to viewModel: UserListViewModelType) {
        viewModel.userList.observe(on: self) { [weak self] _ in self?.updateUsers() }
    }
    private func updateUsers() {
        print("dick", viewModel.userList.value)
        
    }
}
       
protocol UserListViewModelType {
    var userList: Observable<[User]> { get }
    func getUserList()
}

class UserListViewModel: UserListViewModelType {
    let userList: Observable<[User]> = Observable([])
    func getUserList() {
        let urlString = "https://api.github.com/users?since=20&per_page=100"
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
                let jsondata = try decoder.decode([User].self, from: data)
                self.userList.value = jsondata
            } catch let error {
                
            }
        }.resume()
    }
}

struct User: Decodable {
    let name: String
    let image: String
    let admin: Bool
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case image = "avatar_url"
        case admin = "site_admin"
    }
}
