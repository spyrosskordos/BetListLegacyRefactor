//
//  AppCoordinatorTests.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

import Testing
import XCTest

@testable import Bets

@MainActor
@Suite("AppCordinator related tests")
struct AppCoordinatorTests {

    private var navigationController: UINavigationController
    private var mockAppFactory: MockAppFactory
    private var mockWindow: UIWindow
    private var appCoordinator: AppCoordinator

    init() {
        navigationController = UINavigationController()
        mockAppFactory = MockAppFactory()
        mockWindow = UIWindow()
        appCoordinator = AppCoordinator(
            navigation: navigationController,
            appFactory: mockAppFactory,
            window: mockWindow
        )
    }

    @Test("Test start initializes and starts betListCoordinator")
    func testStart_InitializesAndStartsBetListCoordinator() async {
        // Act: Start the app flow by calling the `start` method
        appCoordinator.start()

        // Assert: Verify that the child coordinator was created and added to the list
        #expect(appCoordinator.childCoordinators.count == 1)
        #expect(appCoordinator.childCoordinators.first is MockBetListCoordinator)
        #expect(mockAppFactory.didCallMakeBetRepository)
        #expect(mockAppFactory.didCallMakeBetListCoordinator)
    }

    func testConfigWindow_SetsRootViewControllerAndMakesWindowVisible() {
        // Act: Start the app flow, which also configures the window
        appCoordinator.start()

        // Assert: Verify that the window is set to be the key window and is visible
        #expect(mockWindow.rootViewController == navigationController)
    }
}
