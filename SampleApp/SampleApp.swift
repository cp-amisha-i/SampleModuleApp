//
//  SampleApp.swift
//  SampleApp
//
//  Created by Amisha I on 20/07/22.
//

import UI
import Data
import SwiftUI
import UIPilot

@main
struct SampleApp: App {

    public let pilot: UIPilot<AppRoute>

    init() {
        pilot = .init(initial: .Login)
    }

    var body: some Scene {
        WindowGroup {
            UIPilotHost(pilot) { route in
                switch route {
                case .Login:
                    return AnyView(
                        LoginView(viewModel: LoginViewModel(pilot: pilot))
                            .navigationBarHidden(true)
                    )
                case .HomeScreen:
                    return AnyView(
                        HomeRouteView()
                            .navigationBarHidden(true)
                    )
                }
            }
            .onAppear {
                if AppPreferences.shared.isUserLogin {
                    pilot.pop()
                    pilot.push(.HomeScreen)
                } else {
                    pilot.pop()
                    pilot.push(.Login)
                }
            }
        }
    }
}
