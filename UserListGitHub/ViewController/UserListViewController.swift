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
        view.backgroundColor = UIColor.white
        addUI()
        addConstraints()
        setView()
        bind(to: viewModel)
        viewModel.getUserList()
    }

    private func bind(to viewModel: UserListViewModelType) {
        viewModel.userList.observe(on: self) { [weak self] _ in self?.updateUsers() }
    }

    private func updateUsers() {
        tableView.reloadData()
        print("dick", viewModel.userList.value)
    }

    func setView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        tableView.estimatedRowHeight = 100
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }

        if tableView.contentSize.height != 0 {
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.cellForRow(at: indexPath)
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }

// MARK: - 生成UI的func
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
            make.top.equalTo(baseView.snp.top).offset(60)
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



extension UserListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell",
                                                       for: indexPath) as? UserTableViewCell else {
                                                        return UITableViewCell() }
        cell.bind(users: viewModel.userList.value[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = viewModel.userList.value[indexPath.row].name
         viewModel.getUserInfo(name: name)
        let viewController = UserInfoViewController()
        
        navigationController?.pushViewController(viewController, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.estimatedRowHeight
    }
}
