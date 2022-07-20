//
//  AppPreference.swift
//  SampleApp
//
//  Created by Amisha I on 20/07/22.
//

import Foundation

class AppPreferences {

    static let shared = AppPreferences()
    private let userDefaults: UserDefaults

    init() {
        self.userDefaults = UserDefaults.standard
    }

    public var isUserLogin: Bool {
        get {
            return userDefaults.bool(forKey: "isLogin")
        } set {
            userDefaults.set(newValue, forKey: "isLogin")
            userDefaults.synchronize()
        }
    }
}
