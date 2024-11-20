//
//  ListSeparator.swift
//  Bets
//
//  Created by Spyros Skordos on 20/11/24.
//
import SwiftUI

struct SeparatorModifier: ViewModifier {
    var color: Color
    var edges: VerticalEdge.Set = .all

    func body(content: Content) -> some View {
        content
            .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
            .listRowSeparatorTint(color, edges: edges)
    }
}
extension View {
    func listSeparator(color: Color, edges: VerticalEdge.Set = .all) -> some View {
        self.modifier(SeparatorModifier(color: color, edges: edges))
    }
}
