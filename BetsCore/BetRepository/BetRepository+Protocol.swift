//
//  BetRepository+Protocol.swift
//  Bets
//
//  Created by Spyros Skordos on 20/11/24.
//

public protocol BetRepository {
    func updateOdds() async throws -> [Bet]
}
