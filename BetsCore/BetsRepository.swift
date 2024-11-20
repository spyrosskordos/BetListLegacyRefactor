public protocol BetService {
    func loadBets() async throws -> [Bet]
    func saveBets(_ bets: [Bet]) async throws
}

public class BetRepository {
    private let service: BetService

    public init(service: BetService) {
        self.service = service
    }

    public func updateOdds() async throws -> [Bet] {
        var bets = try await service.loadBets()

        for i in 0 ..< bets.count {
            if bets[i].name == "Winning team" {
                continue
            } else if bets[i].name == "Player performance" {
                handlePlayerPerformance(bet: &bets[i])
            } else if bets[i].name == "Total score" {
                handleTotalScorePerformance(bet: &bets[i])
            } else {
                handleDefaultBet(bet: &bets[i])
            }
        }
        print(bets)
        try await service.saveBets(bets)
        return bets
    }

    private func handleDefaultBet(bet: inout Bet) {
        if bet.quality > 0 {
            bet.quality -= 1
        }

        bet.sellIn -= 1

        if bet.sellIn < 0,
           bet.quality > 0
        {
            bet.quality -= 1
        }
    }

    private func handlePlayerPerformance(bet: inout Bet) {
        if bet.quality < 50 {
            bet.quality += 1
        }

        bet.sellIn -= 1

        if bet.sellIn < 0,
           bet.quality < 50
        {
            bet.quality += 1
        }
    }

    private func handleTotalScorePerformance(bet: inout Bet) {
        if bet.quality < 50 {
            bet.quality += 1
        }
        if bet.sellIn < 11,
           bet.quality < 50
        {
            bet.quality += 1
        }

        if bet.sellIn < 6,
           bet.quality < 50
        {
            bet.quality += 1
        }

        bet.sellIn -= 1

        if bet.sellIn < 0 {
            bet.quality = 0
        }
    }
}
