//
//  HomeRouteViewModel.swift
//  SampleApp
//
//  Created by Amisha I on 20/07/22.
//

import Data
import UIPilot
import Combine
import Foundation

public enum ViewState {
    case START
    case LOADING
    case SUCCESS(users: [User])
    case FAILURE(error: String)
}

public class HomeRouteViewModel: ObservableObject {

    @Published public var currentState: ViewState = .START
    public var cancelables = Set<AnyCancellable>()

    public init() {
        getUsers()
    }

    public func getUsers() {
        self.currentState = .LOADING
        UserRepository.shared.fetchUsers()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Execution Finihsed.")
                case .failure(let error):
                    self.currentState = .FAILURE(error: error.localizedDescription)
                }
            } receiveValue: { users in
                self.currentState = .SUCCESS(users: users)
            }.store(in: &cancelables)
    }
}
