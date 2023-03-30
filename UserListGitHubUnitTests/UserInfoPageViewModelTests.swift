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
        // Given
        let value = UserInfo(UserInfoDataModel(image: "MockImage",
                                               name: "MockName",
                                               nickName: "MockNickName",
                                               loginName: nil,
                                               admin: nil,
                                               location: nil,
                                               link: nil))
        let expectation = expectation(description: "should get UserInfo data successfully")
        // system under testing
        let repository = MockUserInfoRepository(value: value, error: nil, success: expectation)
        let sut = UserInfoPageViewModel(repository: repository)
        // When
        sut.getUserInfo(name: "Mock")
        // Then
        XCTAssertEqual(sut.userInfo.value?.name, "MockName")
        XCTAssertEqual(sut.userInfo.value?.image, "MockImage")
        XCTAssertEqual(sut.userInfo.value?.nickName, "MockNickName")
        wait(for: [expectation], timeout: 0.5)
    }
}
