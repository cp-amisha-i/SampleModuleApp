//
//  UserCell.swift
//  SampleApp
//
//  Created by Amisha I on 20/07/22.
//

import Data
import SwiftUI

public struct UserCell: View {

    public let user: User

    public var body: some View {
        HStack(spacing: 40) {
            AsyncImage(url: URL(string: user.avatar_url)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60, alignment: .center)
            .clipShape(Circle())

            Text(user.login)
                .font(.headline)
            Spacer()
        }
    }
}
