//
//  SceneDelegate.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let repository = UserListRepository()
        let viewModel = UserListViewModel(repository: repository)
        let viewController = UserListViewController(viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationViewController
        self.window = window
        window.makeKeyAndVisible()
    }

}
