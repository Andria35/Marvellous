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
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            if showLogIn {
                LogInView(viewModel: LogInViewModel(authenticationManager: AuthenticationManager()), showLogIn: $showLogIn)
                    .transition(.slide)
            } else {
                SignUpView(viewModel: SignUpViewModel(validator: Validator(), authenticatorManager: AuthenticationManager()), showLogIn: $showLogIn)
                    .transition(.slide)
            }
        }
        .fullScreenCover(isPresented: $onboardingIsPresented) {
            OnboardingView(onboardingIsPresented: $onboardingIsPresented, showLogIn: $showLogIn)
        }
    }
}

// MARK: - Body
#Preview {
    ContentView()
}
