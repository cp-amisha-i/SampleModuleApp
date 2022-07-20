//
//  APIClient.swift
//  NoLonely
//
//  Created by Divyesh Vekariya on 24/12/21.
//

import Foundation
import Alamofire
import Combine

public typealias APIDataResponse = AFDataResponse<Data>
public typealias APICompletion = (_ result: Result<APIDataResponse, Error>) -> Void

public protocol Routable: URLRequestConvertible {
    var task: APITask { get }
}

public class APIClient<Router: Routable> {

    private let session: Session

    public init(session: Session) {
        self.session = session
    }

    public func request<T: Decodable>(_ route: Router) -> AnyPublisher<DataResponse<T, AFError>, Never> {
        switch route.task {
        case .dataTask:
            return session.request(route).publishDecodable(type: T.self).eraseToAnyPublisher()
        }
    }
}

public enum APITask {
    case dataTask
}

extension Routable {
    public var task: APITask {
        .dataTask
    }
}

public class Connectivity {
    public class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

public enum ServiceError: LocalizedError {
    case none
    case serverError
    case networkError
}
