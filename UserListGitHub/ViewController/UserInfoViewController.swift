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
        addConstraint()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: clearButton)
    }

    @objc func clear() {
        navigationController?.popViewController(animated: true)
    }
    
    
    private func addUI() {
        [nameLabel, nickNameLabel].forEach { (view) in
            nameStackView.addArrangedSubview(view)
        }

        [idLabel, adminView].forEach { (view) in
            idStackView.addArrangedSubview(view)
        }

        [clearButton, profileImage, nameStackView, lineView, personImage,
         idStackView, locationImage, locationLabel, linkImage,
         linkLabel].forEach { (view) in
            baseView.addSubview(view)
        }
        self.view.addSubview(baseView)
    }

    private func addConstraint() {
        baseView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }

        clearButton.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(30)
            make.left.equalTo(baseView.snp.left).offset(10)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }

        profileImage.snp.makeConstraints { make in
            make.centerX.equalTo(baseView)
            make.top.equalTo(baseView.snp.top).offset(120)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }

        nameStackView.snp.makeConstraints { make in
            make.centerX.equalTo(profileImage)
            make.top.equalTo(profileImage.snp.bottom).offset(10)
        }

        lineView.snp.makeConstraints { make in
            make.top.equalTo(nameStackView.snp.bottom).offset(20)
            make.left.equalTo(baseView.snp.left).offset(8)
            make.right.equalTo(baseView.snp.right).offset(-8)
            make.height.equalTo(1)
        }

        personImage.snp.makeConstraints { make in
            make.left.equalTo(baseView.snp.left).offset(20)
            make.top.equalTo(lineView.snp.bottom).offset(50)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }

        idStackView.snp.makeConstraints { make in
            make.centerY.equalTo(personImage)
            make.left.equalTo(personImage.snp.right).offset(20)
        }

        adminView.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(70)
        }

        locationImage.snp.makeConstraints { make in
            make.centerX.equalTo(personImage)
            make.top.equalTo(personImage.snp.bottom).offset(50)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }

        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationImage)
            make.left.equalTo(locationImage.snp.right).offset(20)
        }

        linkImage.snp.makeConstraints { make in
            make.centerX.equalTo(locationImage)
            make.top.equalTo(locationImage.snp.bottom).offset(50)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }

        linkLabel.snp.makeConstraints { make in
            make.centerY.equalTo(linkImage)
            make.left.equalTo(linkImage.snp.right).offset(20)
        }
    }

    private var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()

   lazy private var clearButton: UIButton = {
        let button = UIButton()
      //  let image = UIImage(systemName: "clear.fill")
        button.setImage(UIImage(named: "ic_close"), for: .normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(clear), for: .touchUpInside)
        return button
    }()

    private var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "test")
        imageView.layer.cornerRadius = 100
        imageView.clipsToBounds = true
        return imageView
    }()

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.text = "江博弈"
        return label
    }()

    private var nickNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "nickname"
        return label
    }()

    private var nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()

    private var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#999999")
        return view
    }()

    private var personImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = UIColor.black
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
        label.textAlignment = .left
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
        imageView.image = UIImage(systemName: "mappin")
        imageView.tintColor = UIColor.black
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
        imageView.image = UIImage(systemName: "link")
        imageView.tintColor = UIColor.black
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
