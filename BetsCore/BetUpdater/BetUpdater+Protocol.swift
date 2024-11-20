//
//  BetUpdater.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

public protocol BetUpdater {
    func update(bet: inout Bet)
}
