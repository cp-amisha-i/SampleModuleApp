//
//  HomeRouteView.swift
//  SampleApp
//
//  Created by Amisha I on 20/07/22.
//

import Data
import SwiftUI
import UIPilot

public struct HomeRouteView: View {

    @EnvironmentObject var rootPilot: UIPilot<AppRoute>
    @ObservedObject var viewModel = HomeRouteViewModel()

    public init() {}

    public var body: some View {
        GeometryReader { geometry in
            if case .LOADING = viewModel.currentState {
                loaderView()
            } else if case .SUCCESS(let users) = viewModel.currentState {
                List(users) { user in
                    UserCell(user: user)
                        .frame(width: geometry.size.width, height: 80)
                }
            } else if case .FAILURE(let error) = viewModel.currentState {
                VStack(alignment: .center) {
                    Spacer()
                    Text(error)
                        .font(.headline.bold())
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
            }
        }
    }

    public func loaderView() -> some View {
        ZStack {
            Color.black.opacity(0.05)
                .ignoresSafeArea()
            ProgressView()
                .scaleEffect(1, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
        }
    }
}
