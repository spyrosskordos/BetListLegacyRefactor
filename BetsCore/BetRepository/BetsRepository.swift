public class BetRepositoryImpl: BetRepository {
    private let service: BetService
    private let betUpdaterRegistry: BetUpdatersRegistry

    public init(service: BetService, betUpdaterRegistry: BetUpdatersRegistry) {
        self.service = service
        self.betUpdaterRegistry = betUpdaterRegistry
    }

    public func updateOdds() async throws -> [Bet] {
        var bets = try await service.loadBets()
   
        for i in 0 ..< bets.count {
            let betUpdater = betUpdaterRegistry.getUpdater(for: bets[i].name)
            betUpdater.update(bet: &bets[i])
        }

        try await service.saveBets(bets)
        return bets
    }
}
