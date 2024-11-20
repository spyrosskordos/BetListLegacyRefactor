//
//  Coordinator.swift
//  Bets
//
//  Created by Spyros Skordos on 20/11/24.
//
import UIKit

@MainActor
protocol Coordinator {
    var navigation: UINavigationController { get }
    func start()
}
