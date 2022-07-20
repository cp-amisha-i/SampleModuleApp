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

enum ViewState {
    case START
    case LOADING
    case SUCCESS(users: [User])
    case FAILURE(error: String)
}

class HomeRouteViewModel: ObservableObject {

    @Published var currentState: ViewState = .START
    private var cancelables = Set<AnyCancellable>()

    init() {
        getUsers()
    }

    func getUsers() {
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
