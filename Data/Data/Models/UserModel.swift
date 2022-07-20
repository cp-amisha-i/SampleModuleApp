//
//  UserModel.swift
//  SampleApp
//
//  Created by Amisha I on 20/07/22.
//

import Foundation

public struct User: Codable, Identifiable {
    public var id: Int
    public var login: String
    public var avatar_url: String
}
