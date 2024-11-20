//
//  BetUpdaterTestCasesParameters.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

///   - initialSellIn: The initial `sellIn` value of the bet.
///   - initialQuality: The initial `quality` value of the bet.
///   - expectedSellIn: The expected `sellIn` value after the update.
///   - expectedQuality: The expected `quality` value after the update.
///   - description: A description of the test case.
typealias BetUpdaterTestCase = (
    initialSellIn: Int,
    initialQuality: Int,
    expectedSellIn: Int,
    expectedQuality: Int,
    description: String
)

let playerPerformanceTestCases = [
    (initialSellIn: 15, initialQuality: 30, expectedSellIn: 14, expectedQuality: 31, description: "sellIn > 10, quality increases by 1"),
    (initialSellIn: 10, initialQuality: 30, expectedSellIn: 9, expectedQuality: 31, description: "sellIn between 6 and 10, quality increases by 1"),
    (initialSellIn: 5, initialQuality: 30, expectedSellIn: 4, expectedQuality: 31, description: "sellIn < 6, quality increases by 1"),
    (initialSellIn: 0, initialQuality: 30, expectedSellIn: -1, expectedQuality: 32, description: "sellIn < 0, quality increases by 1 after sellIn drops"),
    (initialSellIn: 5, initialQuality: 49, expectedSellIn: 4, expectedQuality: 50, description: "quality cannot exceed 50 even if sellIn < 6"),
    (initialSellIn: 5, initialQuality: 50, expectedSellIn: 4, expectedQuality: 50, description: "quality remains unchanged when it is 50")
]

let totalScoreTestCases = [
    (initialSellIn: 15, initialQuality: 30, expectedSellIn: 14, expectedQuality: 31, description: "sellIn > 10, quality increases by 1"),
    (initialSellIn: 10, initialQuality: 30, expectedSellIn: 9, expectedQuality: 32, description: "sellIn between 6 and 10, quality increases by 2"),
    (initialSellIn: 5, initialQuality: 30, expectedSellIn: 4, expectedQuality: 33, description: "sellIn < 6, quality increases by 3"),
    (initialSellIn: 0, initialQuality: 30, expectedSellIn: -1, expectedQuality: 0, description: "sellIn < 0, quality drops to 0"),
    (initialSellIn: 5, initialQuality: 49, expectedSellIn: 4, expectedQuality: 50, description: "sellIn < 6, quality cannot exceed 50"),
    (initialSellIn: 5, initialQuality: 50, expectedSellIn: 4, expectedQuality: 50, description: "quality is already at max (50), it remains unchanged")
]

let defaultBetUpdaterTestCases = [
    (initialSellIn: 10, initialQuality: 30, expectedSellIn: 9, expectedQuality: 29, description: "sellIn > 0, quality decreases by 1"),
    (initialSellIn: 0, initialQuality: 30, expectedSellIn: -1, expectedQuality: 28, description: "sellIn reaches 0, quality decreases by 1 and again when sellIn < 0"),

    (initialSellIn: 10, initialQuality: 0, expectedSellIn: 9, expectedQuality: 0, description: "quality is 0, no further decrease"),

    (initialSellIn: 5, initialQuality: 1, expectedSellIn: 4, expectedQuality: 0, description: "quality reaches 0 after sellIn > 0"),

    (initialSellIn: -5, initialQuality: 1, expectedSellIn: -6, expectedQuality: 0, description: "quality reaches 0 after sellIn < 0")
]
