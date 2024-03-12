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
        Group {
            if showLogIn {
                LogInView(viewModel: LogInViewModel())
            } else {
                SignUpView(viewModel: SignUpViewModel(validator: Validator(), authenticatorManager: AuthenticationManager()))
            }
        }
        .fullScreenCover(isPresented: $onboardingIsPresented) {
            OnboardingView(onboardingIsPresented: $onboardingIsPresented, showLogIn: $showLogIn)
            
        }
    }
}
    
#Preview {
        ContentView()
    }
