final class MockAppFactory: AppFactory {
    var didCallMakeBetRepository = false
    var didCallMakeBetListCoordinator = false

    func makeBetRepository() -> BetRepository {
        didCallMakeBetRepository = true
        return MockBetRepository()
    }
    
    func makeBetlistCoordinator(navigation: UINavigationController, betRepository: BetRepository) -> Coordinator {
        didCallMakeBetListCoordinator = true
        return MockBetListCoordinator()
    }
}

final class MockBetRepository: BetRepository {
    // Implement required methods or leave empty if not needed
}

final class MockBetListCoordinator: Coordinator {
    var didStart = false
    
    func start() {
        didStart = true
    }
}
