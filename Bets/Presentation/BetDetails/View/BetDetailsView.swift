//
//  BetDetailsView.swift
//  Bets
//
//  Created by Spyridon Skordos on 20/11/24.
//

import SwiftUI

struct BetDetailsView:  View {
    let viewModel: BetDetailsViewModel
    var body: some View {
        ZStack {
            Color(.betssonBlack)
                .ignoresSafeArea()
            Text("Unlock it in full mode 🔒 😋")
                .font(.title)
                .foregroundStyle(Color(.betssonOrange))
        }
    }
}
