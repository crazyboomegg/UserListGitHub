//
//  MockUserRepository.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/29.
//

import XCTest
@testable import UserListGitHub

struct MockUserRepository: UserRepositoryType {
    func getUserInfo(urlString: String, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        
    }
    
    let value: [User]?
    let error: Error?
    let successExpectation: XCTestExpectation?
    let failedExpectation: XCTestExpectation?
    init(value: [User]?, error: Error?, success: XCTestExpectation? = nil, failed: XCTestExpectation? = nil) {
        self.value = value
        self.error = error
        self.successExpectation = success
        self.failedExpectation = failed
    }
    func getUserList(urlString: String, completion: @escaping (Result<[User], Error>) -> Void) {
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
