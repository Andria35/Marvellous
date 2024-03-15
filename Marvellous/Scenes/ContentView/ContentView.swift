//
//  ContentView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: ContentViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            
            if viewModel.userIsLoggedIn {
                Button(action: {
                    viewModel.userIsLoggedIn = false
                }, label: {
                    Text("\(viewModel.authenticatedUser?.email ?? "")")
                        .foregroundStyle(.white)
                })
            } else {
                AuthenticationView()
            }

        }
        .onAppear {
            viewModel.getAuthenticatedUser()
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView(viewModel: ContentViewModel(authenticationManager: AuthenticationManager()))
}
