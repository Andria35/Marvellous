//
//  AuthenticationView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 15.03.24.
//

import SwiftUI

struct AuthenticationView: View {
    
    // MARK: - Properties
    @State var onboardingIsPresented: Bool = true
    @State var showLogIn: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            if showLogIn {
                LogInView(viewModel: LogInViewModel(authenticationManager: AuthenticationManager(), signInGoogleHelper: SignInGoogleHelper(utilities: Utilities())), showLogIn: $showLogIn)
                    .transition(.slide)
            } else {
                SignUpView(viewModel: SignUpViewModel(validator: Validator(), authenticatorManager: AuthenticationManager()), showLogIn: $showLogIn)
                    .transition(.slide)
            }
            
            OnboardingView(onboardingIsPresented: $onboardingIsPresented, showLogIn: $showLogIn)
                .opacity(onboardingIsPresented ? 1 : 0)
        }
    }
}

// MARK: - Preview
#Preview {
    AuthenticationView()
}
