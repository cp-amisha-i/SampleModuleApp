//
//  LoginView.swift
//  SampleApp
//
//  Created by Amisha I on 19/07/22.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack {
            Button("Login Here...") {
                viewModel.onLoginClick()
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(Color.yellow)
            .cornerRadius(30)

            Text("Welcome to our community")
                .fontWeight(.ultraLight)
                .font(.system(size: 12))
        }
    }
}
