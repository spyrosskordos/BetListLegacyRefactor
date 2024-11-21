//
//  BetsUpdaterRegistryTests.swift
//  Bets
//
//  Created by Spyridon Skordos on 17/11/24.
//

@testable import BetsCore
import Testing
//
//@Suite("BetUpdatersRegistry related tests")
//final class BetUpdatersRegistryImplTests {
//    private var betUpdatersRegistry: BetUpdatersRegistryImpl
//    
//    init() {
//        self.betUpdatersRegistry = BetUpdatersRegistryImpl()
//    }
//    
//    @Test("Test getting total score bet updater")
//    func testGetUpdater_TotalScoreName() {
//        // Arrange: Test with a valid bet name
//        let betName = "Total score"
//        
//        // Act: Get the updater
//        let updater = betUpdatersRegistry.getUpdater(for: betName)
//        
//        // Assert: Verify that the totalScore updater is returned
//        #expect((updater as! TotalScoreBetUpdater) != nil)
//        
//    }
//    
//    func testGetUpdater_PlayerPerformanceName() {
//        // Arrange: Test with a valid bet name
//        let betName = "Player performance"
//        
//        // Act: Get the updater
//        let updater = betUpdatersRegistry.getUpdater(for: betName)
//        
//        // Assert: Verify that the totalScore updater is returned
//        #expect(updater is TotalScoreBetUpdater)
//    }
//    
//  
////    // Test that another valid bet name returns the correct updater
////    func testGetUpdater_AnotherValidBetName() {
////        // Arrange: Test with another valid bet name
////        let betName = "Player performance"
////
////        // Act: Get the updater
////        let updater = betUpdatersRegistry.getUpdater(for: betName)
////
////        // Assert: Verify that the correct updater is returned
////        XCTAssertTrue(updater is PlayerPerformanceBetUpdater, "Expected PlayerPerformanceBetUpdater for bet name \(betName)")
////    }
////
////    // Test that an invalid bet name returns the default updater
////    func testGetUpdater_InvalidBetName() {
////        // Arrange: Test with an invalid bet name
////        let betName = "Invalid bet name"
////
////        // Act: Get the updater
////        let updater = betUpdatersRegistry.getUpdater(for: betName)
////
////        // Assert: Verify that the default updater is returned
////        XCTAssertTrue(updater is DefaultBetUpdater, "Expected DefaultBetUpdater for bet name \(betName)")
////    }
////
////    // Test that an empty bet name returns the default updater
////    func testGetUpdater_EmptyBetName() {
////        // Arrange: Test with an empty bet name
////        let betName = ""
////
////        // Act: Get the updater
////        let updater = betUpdatersRegistry.getUpdater(for: betName)
////
////        // Assert: Verify that the default updater is returned
////        XCTAssertTrue(updater is DefaultBetUpdater, "Expected DefaultBetUpdater for empty bet name")
////    }
////
////    // Test that nil-like behavior (if applicable) returns the default updater
////    func testGetUpdater_NilBetName() {
////        // Arrange: Test with a nil bet name (if your system allows this type of scenario)
////        let betName: String? = nil
////
////        // Act: Get the updater
////        let updater = betUpdatersRegistry.getUpdater(for: betName ?? "")
////
////        // Assert: Verify that the default updater is returned
////        XCTAssertTrue(updater is DefaultBetUpdater, "Expected DefaultBetUpdater for nil bet name")
////    }
//}
