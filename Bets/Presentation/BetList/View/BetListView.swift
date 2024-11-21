//
//  BetListView.swift
//  Bets
//
//  Created by Spyros Skordos on 20/11/24.
//
import BetsCore
import SwiftUI

struct BetListView: View {
    let viewModel: BetListViewModel
    var body: some View {
        ZStack {
            switch viewModel.state {
            case .loading:
                loadingView
            case .loaded(let bets):
                listView(with: bets)
            case .error(let message):
                errorMessageView(with: message)
            }
        }
        .onViewDidLoadTask {
            await viewModel.getOdds()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.betssonBlack))
    }

    var loadingView: some View {
        ProgressView()
    }

    func listView(with bets: [Bet]) -> some View {
        List {
            ForEach(bets) { bet in
                Button {
                    viewModel.betTapped(bet: bet)
                } label: {
                    BetListViewItem(bet: bet)
                }
                .buttonStyle(.plain)
                .listSeparator(color: Color(.betssonOrange))
            }
            .listRowBackground(Color(.betssonDarkGray))
        }
        .scrollContentBackground(.hidden)
    }

    func errorMessageView(with message: String) -> some View {
        VStack {
            Text("❌: " + message)
                .font(.headline)
                .foregroundStyle(Color(.betssonlightWhite))
            Button(action: {
                Task {
                    await viewModel.getOdds()
                }
            }) {
                Text("Retry")
                    .bold()
                    .padding()
                    .background(Color(.bettsonLightBlue))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}
