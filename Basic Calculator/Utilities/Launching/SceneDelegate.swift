//
//  SceneDelegate.swift
//  Basic Calculator
//
//  Created by Tariq on 31/08/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: homeVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

