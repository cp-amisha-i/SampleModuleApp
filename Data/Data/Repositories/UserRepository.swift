//
//  UserRepository.swift
//  SampleApp
//
//  Created by Amisha I on 20/07/22.
//

import Combine
import Alamofire
import Foundation

public class UserRepository {

    public static let shared = UserRepository()
    let client: APIClient<UserApi> = .init(session: .default)

    public func fetchUsers() -> AnyPublisher<[User], ServiceError> {
        guard Connectivity.isConnectedToInternet else { return Fail(error: ServiceError.networkError).eraseToAnyPublisher() }
        return client.request(.fetchusers)
            .flatMap { dataResponseToAnyPublisher(response: $0) }
            .eraseToAnyPublisher()
    }
}

public func dataResponseToAnyPublisher<T: Decodable>(response: DataResponse<T, AFError>) -> AnyPublisher<T, ServiceError> {
    Future { promise in
        switch response.result {
        case .success(let data):
            promise(.success(data))
        case .failure(let error):
            LogE("UserRepository: Fail with error: \(error)")
            promise(.failure(ServiceError.serverError))
        }
    }.eraseToAnyPublisher()
}

extension DataResponse {
    public var isSuccessful: Bool {
        if let response = response {
            return 200 ... 299 ~= response.statusCode
        }
        return false
    }
}
