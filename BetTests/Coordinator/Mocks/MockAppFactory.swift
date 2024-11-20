//
//  MockAppFactory.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

@testable import Bets
@testable import BetsCore
import UIKit

final class MockAppFactory: AppFactory {
    var didCallMakeBetRepository = false
    var didCallMakeBetListCoordinator = false

    func makeBetRepository() -> BetRepository {
        didCallMakeBetRepository = true
        return MockBetRepository(response: .mockResponse([]))
    }
    
    func makeBetlistCoordinator(navigation: UINavigationController, betRepository: BetRepository) -> Coordinator {
        didCallMakeBetListCoordinator = true
        return MockBetListCoordinator(navigation: navigation)
    }
}



final class MockBetListCoordinator: Coordinator {
    var navigation: UINavigationController
    var didStart = false
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    func start() {
        didStart = true
    }
}
