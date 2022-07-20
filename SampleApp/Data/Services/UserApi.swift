//
//  UserApi.swift
//  SampleApp
//
//  Created by Amisha I on 20/07/22.
//

import Foundation
import Alamofire

public enum UserApi {
    case fetchusers

    private var parameters: (ParameterType, ParameterEncoding)? {
        switch self {
        default:
            return nil
        }
    }

    private var path: String {
        switch self {
        case .fetchusers:
            return Constants.user_base_url
        }
    }

    private var method: HTTPMethod {
        switch self {
        case .fetchusers:
            return .get
        }
    }

    private var headers: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
}

extension UserApi: Routable {
    public func asURLRequest() throws -> URLRequest {
        let method = self.method
        let headers = HTTPHeaders(self.headers ?? [:])
        var request = try URLRequest(url: path, method: method, headers: headers)

        if let (parameterkind, encoding) = self.parameters {
            request = try request.encoded(parameterKind: parameterkind, parameterEncoding: encoding)
        }
        return request
    }
}

public enum ParameterType {
    case jsonDic([String: Any])
    case encodable(Encodable)
}

extension URLRequest {
    public mutating func encoded(parameterKind: ParameterType, parameterEncoding: ParameterEncoding, encoder: JSONEncoder = JSONEncoder()) throws -> URLRequest {
        switch parameterKind {
        case .encodable(let encodable):
            do {
                let encodable = AnyEncodable(encodable)
                httpBody = try encoder.encode(encodable)

                let contentTypeHeaderName = "Content-Type"
                if value(forHTTPHeaderField: contentTypeHeaderName) == nil {
                    setValue("application/json", forHTTPHeaderField: contentTypeHeaderName)
                }
                return self
            } catch {
                throw error
            }

        case .jsonDic(let parameters):
            do {
                return try parameterEncoding.encode(self, with: parameters)
            } catch {
                throw error
            }
        }
    }
}

public struct AnyEncodable: Encodable {

    private let encodable: Encodable

    public init(_ encodable: Encodable) {
        self.encodable = encodable
    }

    public func encode(to encoder: Encoder) throws {
        try encodable.encode(to: encoder)
    }
}
