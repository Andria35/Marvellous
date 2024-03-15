//
//  ContentView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State var onboardingIsPresented: Bool = true
    @State var showLogIn: Bool = false
    @StateObject var viewModel: ContentViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()

            AuthenticationView()

        }
//        .onAppear {
//            viewModel.getAuthenticatedUser()
//        }
    }
}

// MARK: - Body
#Preview {
    ContentView(viewModel: ContentViewModel(authenticationManager: AuthenticationManager()))
}
