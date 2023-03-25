//
//  User.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/25.
//

import Foundation

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
