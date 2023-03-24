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
        addUI()
        addConstraints()
        bind(to: viewModel)
        viewModel.getUserList()
    }
    
    private func bind(to viewModel: UserListViewModelType) {
        viewModel.userList.observe(on: self) { [weak self] _ in self?.updateUsers() }
    }
    
    private func updateUsers() {
        print("dick", viewModel.userList.value)
    }
    
    func setView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
    
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        
        if self.tableView.contentSize.height != 0 {
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.cellForRow(at: indexPath)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    
    
    private func addUI() {
        baseView.addSubview(tableView)
        self.view.addSubview(baseView)
    }
    
    private func addConstraints() {
        baseView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.left.equalTo(baseView.snp.left).offset(0)
            make.right.equalTo(baseView.snp.right).offset(0)
            make.top.equalTo(baseView.snp.top).offset(0)
            make.bottom.equalTo(baseView.snp.bottom).offset(0)
        }
    }
    
    private var baseView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
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


extension UserListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) 
       // cell.bind(users: viewModel.users[indexPath.row])
        
        return cell
    }
    
    
}
