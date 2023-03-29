//
//  UserInfoPageViewModelTests.swift
//  UserListViewModelTests
//
//  Created by 江柏毅 on 2023/3/29.
//

import XCTest
@testable import UserListGitHub

class UserInfoPageViewModelTests: XCTestCase {
    func test_getUserInfoSuccess_getUserInfoData() {
        let value = UserInfo(UserInfoDataModel(image: "MockImage", name: nil, nickName: "MockName", loginName: nil, admin: nil, location: nil, link: nil))
        let expectation = expectation(description: "should get UserInfo data successfully")
        // system under testing
//        let sut = UserInfoPageViewModel()
    }
    
}
