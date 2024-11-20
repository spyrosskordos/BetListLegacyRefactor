//
//  AppFactory.swift
//  Bets
//
//  Created by Spyros Skordos on 20/11/24.
//
import BetsCore
import UIKit

/// Factory for creating application-level coordinators.
@MainActor
/// Factory for creating application-level components and dependencies.
protocol AppFactory {
    /// Creates a Bet List Coordinator for managing the Bet List flow.
    func makeBetlistCoordinator(
        navigation: UINavigationController,
        betRepository: BetRepository
    ) -> Coordinator

    /// Creates and returns a Bet Repository for managing bet data.
    func makeBetRepository() -> BetRepository
}

struct AppFactoryImpl: AppFactory {
    func makeBetlistCoordinator(
        navigation: UINavigationController,
        betRepository: BetRepository
    ) -> Coordinator {
        let betListFactory = BetListFactoryImpl()
        let betListCoordinator = BetListCoordinator(
            navigation: navigation,
            betListFactory: betListFactory,
            betRepository: betRepository
        )
        return betListCoordinator
    }

    func makeBetRepository() -> BetRepository {
        let service = RemoteBetService.instance
        let updaterRegistry = BetUpdatersRegistryImpl()
        return BetRepositoryImpl(service: service, betUpdaterRegistry: updaterRegistry)
    }
}
