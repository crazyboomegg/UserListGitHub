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
                failedExpectation?.fulfill()
                completion(.failure(error))
            }
            if let value = value {
                successExpectation?.fulfill()
                completion(.success(value))
            }
        }
    }
    func test_getUserListSuccess_get1UserListData() {
        // Given
        let value = [User(user: UserDataModel(name: "MockName", image: "MockImage", admin: true))]
        let expectation = expectation(description: "should get data successfully")
        let repo = MockUserRepository(value: value, error: nil, success: expectation)
        let sut = UserListViewModel(repository: repo)
        // When
        sut.getUserList()
        // Then
        XCTAssertEqual(sut.userList.value.count, 1)
        XCTAssertEqual(sut.userList.value.first?.name, "MockName")
        XCTAssertEqual(sut.userList.value.first?.image, "MockImage")
        XCTAssertEqual(sut.userList.value.first?.admin, true)
        wait(for: [expectation], timeout: 0.5)
    }
    
    func test_getUserListSuccess_get2UserListData() {
        // Given
        let value = [User(user: UserDataModel(name: "MockName1", image: "MockImage1", admin: true)),
                     User(user: UserDataModel(name: "MockName2", image: "MockImage2", admin: true))
        ]
        let expectation = expectation(description: "should get data successfully")
        let repo = MockUserRepository(value: value, error: nil, success: expectation)
        let sut = UserListViewModel(repository: repo)
        // When
        sut.getUserList()
        // Then
        XCTAssertEqual(sut.userList.value.count, 2)
        wait(for: [expectation], timeout: 0.5)
    }
    enum MockError: Error {
        case badResponse
    }
        
    func test_getUserListfailed_getError() {
        // Given
        let expectation = expectation(description: "should get error")
        let repo = MockUserRepository(value: nil, error: MockError.badResponse, failed: expectation)
        let sut = UserListViewModel(repository: repo)
        // When
        sut.getUserList()
        // Then
        XCTAssertEqual(sut.error.value, MockError.badResponse.localizedDescription)
        wait(for: [expectation], timeout: 0.5)
    }
}

