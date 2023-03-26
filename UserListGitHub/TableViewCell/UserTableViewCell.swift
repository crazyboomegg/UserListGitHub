//
//  UserTableViewCell.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/25.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

final class UserTableViewCell: UITableViewCell {
    var user: UserDataModel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addUI()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(users: User) {
        self.idLabel.text = users.name
        self.profileImage.kf.setImage(with: URL(string: users.image))
        if users.admin {
            adminView.isHidden = false
        } else {
            adminView.isHidden = true
        }
    }

    private func addUI() {
        [idLabel, adminView].forEach { (view) in
            stackView.addArrangedSubview(view)
        }
        [profileImage, stackView].forEach { (view) in
            baseView.addSubview(view)
        }
        contentView.addSubview(baseView)
    }

    func addConstraints() {
        baseView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(1)
            make.right.equalTo(contentView.snp.right).offset(-1)
            make.top.equalTo(contentView.snp.top).offset(3)
            make.bottom.equalTo(contentView.snp.bottom).offset(-3)
        }
        profileImage.snp.makeConstraints { make in
            make.left.equalTo(baseView.snp.left).offset(25)
            make.centerY.equalTo(baseView)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        stackView.snp.makeConstraints { make in
            make.left.equalTo(profileImage.snp.right).offset(15)
            make.centerY.equalTo(profileImage)
            make.width.equalTo(100)
        }
        adminView.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(70)
        }
    }

    private var baseView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.backgroundColor = UIColor.white
        view.layer.shadowOffset = CGSize(width: 1.0, height: 1)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 1.5
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()

    private var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
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
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
}
