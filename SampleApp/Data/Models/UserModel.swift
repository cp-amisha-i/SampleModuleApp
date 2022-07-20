//
//  UserModel.swift
//  SampleApp
//
//  Created by Amisha I on 20/07/22.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int
    var login: String
    var avatar_url: String
}
