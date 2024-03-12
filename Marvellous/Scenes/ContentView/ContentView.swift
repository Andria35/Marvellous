//
//  ContentView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct ContentView: View {
    
    @State var onboardingIsPresented: Bool = true
    @State var showLogIn: Bool = false
    
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
//            SignUpView(viewModel: SignUpViewModel(validator: Validator(), authenticatorManager: AuthenticationManager()), showLogIn: $showLogIn)
//                .fullScreenCover(isPresented: $showLogIn, content: {
//                    LogInView(viewModel: LogInViewModel(authenticationManager: AuthenticationManager()), showLogIn: $showLogIn)
//                })
        }
        .fullScreenCover(isPresented: $onboardingIsPresented) {
            OnboardingView(onboardingIsPresented: $onboardingIsPresented, showLogIn: $showLogIn)
            
        }
    }
}
    
#Preview {
        ContentView()
    }
