//
//  UserInfoViewModel.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/26.
//
struct UserInfo {
    let image: String?
    let name: String?
    let nickName: String?
    let loginName: String?
    let admin: Bool?
    let location: String?
    let link: String?

    init(_ userInfo: UserInfoDataModel) {
        image = userInfo.image
        name = userInfo.name
        nickName = userInfo.nickName
        loginName = userInfo.loginName
        admin = userInfo.admin
        location = userInfo.location
        link = userInfo.link
    }
}

