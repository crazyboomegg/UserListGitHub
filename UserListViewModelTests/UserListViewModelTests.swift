//
//  UserListViewModelTests.swift
//  UserListViewModelTests
//
//  Created by 江柏毅 on 2023/3/28.
//

import XCTest
@testable import UserListGitHub

class UserListViewModelTests: XCTestCase {
    struct MockUserRepository: UserRepositoryType {
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
                completion(.failure(error))
                failedExpectation?.fulfill()
            }
            if let value = value {
                completion(.success(value))
                successExpectation?.fulfill()
            }
        }
   
    }
    func test_getUserListSuccess_getUserListData() {
        // Given
        let value = [User(user: UserDataModel(name: "MockName", image: "MockName", admin: true))]
        let expectation = expectation(description: "should get data successfully")
        let repo = MockUserRepository(value: value, error: nil, success: expectation)
        let sut = UserListViewModel(repository: repo)
        // When
        sut.getUserList()
        // Then
        XCTAssertEqual(sut.userList.value.count, 1)
        wait(for: [expectation], timeout: 0.5)
    }
    
}

