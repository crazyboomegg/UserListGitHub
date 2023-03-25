//
//  UserInfoViewController.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/25.
//

import Foundation
import UIKit

class UserInfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        addUI()
        addConstraints()
    }

    private func addUI() {
        
    }

    private func addConstraints() {
        
    }
 
    private var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()

    private var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.text = "江博弈"
        return label
    }()

    private var nickNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "nickname"
        return label
    }()
  
    private var nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()

    private var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#999999")
        return view
    }()

    private var loginImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "person")
        return imageView
    }()

    private var idLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "江博弈"
        return label
    }()

    private var adminView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(hexString: "#2986cc")

        let label = UILabel.init()
        label.text = "STAFF"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalTo(view)
            make.centerX.equalTo(view)
        }
        return view
    }()

    private var idStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()

    private var locationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mappin")
        return imageView
    }()

    private var locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "San fafafa"
        return label
    }()

    private var linkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "link")
        return imageView
    }()

    private var linkLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(hexString: "#2986cc")
        label.text = "http//dddddd"
        return label
    }()
}
