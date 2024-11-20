//
//  BetListFactory.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

import BetsCore
import SwiftUI

/// A factory protocol for creating view controllers related to the Bet List feature.
@MainActor
protocol BetListFactory {
    /// Creates and returns the main module (Bet List) with the given bet repository and delegate for handling actions.
    func makeModule(with betRepository: BetRepository, delegate: BetListActions) -> UIViewController
    /// Creates and returns the Bet Details module for the given bet.
    func makeBetDetails(with bet: Bet) -> UIViewController
}

struct BetListFactoryImpl: BetListFactory {
    func makeModule(with betRepository: BetRepository, delegate: BetListActions) -> UIViewController {
        let viewModel = BetListViewModel(betRepository: betRepository, betListActions: delegate)
        let view = BetListView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        viewController.title = "Odds"
        return viewController
    }

    func makeBetDetails(with bet: Bet) -> UIViewController {
        let viewModel = BetDetailsViewModel(bet: bet)
        let view = BetDetailsView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        viewController.title = bet.name
        return viewController
    }
}
