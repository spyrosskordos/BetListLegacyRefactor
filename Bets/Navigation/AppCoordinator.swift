//
//  AppCoordinator.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

import UIKit
/// Main App Coordinator responsible for managing the app's flow and initial setup.
final class AppCoordinator: Coordinator {
    private let appFactory: AppFactory // Factory for creating dependencies and modules
    var navigation: UINavigationController // Main navigation controller for the app
    var childCoordinators = [Coordinator]() // Child coordinators to manage specific flows
    
    init(navigation: UINavigationController, appFactory: AppFactory, window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }
    
    /// Starts the app's flow by initializing and starting the Bet List Coordinator.
    func start() {
        let betRepository = appFactory.makeBetRepository()
        let coordinator = appFactory.makeBetlistCoordinator(navigation: navigation, betRepository: betRepository)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    /// Configures the window by setting the navigation controller as the root.
    /// - Parameter window: The optional UIWindow instance to configure.
    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible() 
    }
}
