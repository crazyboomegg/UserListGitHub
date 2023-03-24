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
        // Do any additional setup after loading the view.
    }

}

protocol UserListViewModelType {
    
}

class UserListViewModel: UserListViewModelType {
    
}
