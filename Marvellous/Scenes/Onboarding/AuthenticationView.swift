//
//  AuthenticationView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct AuthenticationView: View {
    
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
        .ignoresSafeArea()
    }
}

// MARK: - UI Components
extension AuthenticationView {
    // MARK: - AuthenticationButtonsVStack
    private var authenticationButtonsVStack: some View {
        VStack {
            ButtonComponentView(title: "SignUp", action: {}, backgroundColor: .red)
            ButtonComponentView(title: "LogIn", action: {}, backgroundColor: nil)
        }
        .padding()
        .padding(.bottom)
    }
}

// MARK: - Preview
#Preview {
    AuthenticationView()
}
