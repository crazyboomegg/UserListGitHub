//
//  MockUserInfoRepository.swift
//  UserListViewModelTests
//
//  Created by 江柏毅 on 2023/3/30.
//

import XCTest
@testable import UserListGitHub

struct MockUserInfoRepository: UserInfoRepositoryType {
    let value: UserInfo?
    let error: Error?
    let successExpectation: XCTestExpectation?
    let failedExpectation: XCTestExpectation?
    init(value: UserInfo?, error: Error?, success: XCTestExpectation? = nil, failed: XCTestExpectation? = nil) {
        self.value = value
        self.error = error
        self.successExpectation = success
        self.failedExpectation = failed
    }
    func getUserInfo(urlString: String, completion: @escaping (Result<UserListGitHub.UserInfo, Error>) -> Void) {
        if let error = error {
            failedExpectation?.fulfill()
            completion(.failure(error))
        }
        if let value = value {
            successExpectation?.fulfill()
            completion(.success(value))
        }
    }
}
