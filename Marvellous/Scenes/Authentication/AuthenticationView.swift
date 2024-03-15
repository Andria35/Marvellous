//
//  AuthenticationView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 15.03.24.
//

import SwiftUI

struct AuthenticationView: View {
    
    @State var onboardingIsPresented: Bool = true
    @State var showLogIn: Bool = false
    
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

#Preview {
    AuthenticationView()
}
