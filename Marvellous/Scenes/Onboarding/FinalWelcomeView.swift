//
//  FinalWelcomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct FinalWelcomeView: View {
    
    @Binding var onboardingIsPresented: Bool
    @Binding var showLogIn: Bool
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            VStack {
                OnboardingImageComponentView(imageName: "AuthenticationViewImage")
                authenticationButtonsVStack
                Spacer()
            }
        }
    }
}

// MARK: - UI Components
extension FinalWelcomeView {
    // MARK: - AuthenticationButtonsVStack
    private var authenticationButtonsVStack: some View {
        VStack {
            ButtonComponentView(title: "SignUp", action: {
                showLogIn = false
                onboardingIsPresented = false
                
            }, backgroundColor: .red, isDisabled: false)
            ButtonComponentView(title: "LogIn", action: {
                showLogIn = true
                onboardingIsPresented = false
                
            }, backgroundColor: nil, isDisabled: false)
        }
        .padding()
        .padding(.bottom)
    }
}

// MARK: - Preview
#Preview {
    FinalWelcomeView(onboardingIsPresented: .constant(true), showLogIn: .constant(true))
}
