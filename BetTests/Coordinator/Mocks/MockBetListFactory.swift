//
//  MockBetListFactory.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//
import UIKit
@testable import Bets
@testable import BetsCore

final class MockBetListFactory: BetListFactory {
    var didCallMakeModule = false
    var didCallMakeBetDetails = false
    let mockModule: UIViewController = UIViewController()
    let mockBetDetails: UIViewController = UIViewController()
    var receivedBet: Bet?

    func makeModule(with repository: BetRepository, delegate: BetListActions) -> UIViewController {
        didCallMakeModule = true
        return mockModule
    }

    func makeBetDetails(with bet: Bet) -> UIViewController {
        didCallMakeBetDetails = true
        receivedBet = bet
        return mockBetDetails
    }
}

