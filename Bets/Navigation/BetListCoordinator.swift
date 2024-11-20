//
//  BetListCoordinator.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//
import SwiftUI
import UIKit
import BetsCore

/// Coordinator for managing the Bet List feature flow.
final class BetListCoordinator: Coordinator {
    let navigation: UINavigationController
    private let betListFactory: BetListFactory
    private let betRepository: BetRepository

    /// Initializes the coordinator with required dependencies.
    init(
        navigation: UINavigationController,
        betListFactory: BetListFactory,
        betRepository: BetRepository
    ) {
        self.navigation = navigation
        self.betListFactory = betListFactory
        self.betRepository = betRepository
    }

    /// Starts the Bet List flow by setting up the initial view controller.
    func start() {
        let controller = betListFactory.makeModule(with: betRepository, delegate: self)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.navigationBar.barTintColor = .clear
        navigation.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(Color(.betssonOrange))]
        navigation.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(Color(.betssonOrange))]

        navigation.pushViewController(controller, animated: false)
    }

    /// Navigates to the Bet Details screen for the specified bet.
    private func navigateToDetail(for bet: Bet) {
        let controller = betListFactory.makeBetDetails(with: bet)
        navigation.pushViewController(controller, animated: true)
    }
}

extension BetListCoordinator: BetListActions {
    /// Handles the event when a bet is tapped, navigating to the details screen.
    func betTapped(bet: Bet) {
        navigateToDetail(for: bet)
    }
}
