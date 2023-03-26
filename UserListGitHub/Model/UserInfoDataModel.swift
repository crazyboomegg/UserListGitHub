//
//  UserInfo.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/26.
//

import Foundation

struct UserInfoDataModel: Decodable {
    let image: String?
    let name: String?
    let nickName: String?
    let loginName: String?
    let admin: Bool?
    let location: String?
    let link: String?

    enum CodingKeys: String, CodingKey {
        case image = "avatar_url"
        case name = "name"
        case nickName = "bio"
        case loginName = "login"
        case admin = "site_admin"
        case location = "location"
        case link = "blog"
    }
}
