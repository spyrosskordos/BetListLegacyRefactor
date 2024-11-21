import BetsCore
//
//  BetListViewItem.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//
import SwiftUI

struct BetListViewItem: View {
    let bet: Bet
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(bet.name.rawValue)
                    .font(.headline)
                    .foregroundStyle(Color(.betssonlightWhite))

                Text("\(bet.sellIn)")
                    .font(.subheadline)
                    .foregroundStyle(Color(.bettsonLightBlue))
            }
            Spacer()
            Text("\(bet.quality)")
                .font(.subheadline)
                .foregroundStyle(Color(.betssonOrange))
                .frame(width: 40)

        }
        .padding()
        .frame(height: 60)
        .background(Color(.betssonDarkGray))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BetListViewItem(bet: Bet(name: .cleanSheet, sellIn: 22, quality: 1))
}
