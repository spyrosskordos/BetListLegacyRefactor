//
//  BetListViewModel.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//
import BetsCore
import SwiftUI

/// Protocol to handle user actions on the Bet List.
/// Implemented by the Coordinator to manage navigation.
@MainActor
protocol BetListActions: AnyObject {
    func betTapped(bet: Bet)
}

@MainActor
@Observable class BetListViewModel {
    /// Represents the various states of the Bet List view.
    enum BetListViewState {
        case loading // Indicates the data is being fetched
        case loaded([Bet]) // Indicates the data has been successfully fetched
        case error(String) // Represents an error state with a message
    }

    private weak var delegate: BetListActions?
    private(set) var state: BetListViewState = .loading
    private let betRepository: BetRepository

    init(betRepository: BetRepository, betListActions: BetListActions?) {
        self.betRepository = betRepository
        self.delegate = betListActions
    }

    
    func getOdds() async {
        do {
            let bets = try await betRepository.updateOdds()
            state = .loaded(bets)
        } catch {
            state = .error(error.localizedDescription)
        }
    }

    func betTapped(bet: Bet) {
        delegate?.betTapped(bet: bet)
    }
}
