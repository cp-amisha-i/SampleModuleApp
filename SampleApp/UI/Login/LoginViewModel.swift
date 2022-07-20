//
//  LoginViewModel.swift
//  SampleApp
//
//  Created by Amisha I on 20/07/22.
//

import Data
import Combine
import UIPilot
import Foundation

class LoginViewModel: ObservableObject {

    @Published var isLogin = false
    private let appPilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func onLoginClick() {
        self.isLogin = true
        AppPreferences.shared.isUserLogin = isLogin
        appPilot.push(.HomeScreen)
    }
}
