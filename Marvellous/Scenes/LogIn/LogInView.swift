//
//  LogInView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 29.02.24.
//

import SwiftUI

struct LogInView: View {
    
    @EnvironmentObject var router: Router
    @StateObject var viewModel: LogInViewModel
    @State var forgotPasswordTapped: Bool = false
    
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            
            VStack {
                Image("MarvelLogo")
                    .padding()
                
                authenticationTextFieldVStack
                
                ButtonComponentView(title: "LogIn", action: {
                    Task {
                        await viewModel.signIn()
                    }
                }, backgroundColor: .red, isDisabled: false)
                    .padding(.top)
                
                Text("Forgot Password?")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .onTapGesture {
                        forgotPasswordTapped = true
                    }
                
                Spacer()
                
                googleAuthenticationVStack
                
                Spacer()
                
                alreadyAccountHStack
                
                Spacer()
                
            }
            .padding()
        }
        .alert("Can't Log In ❌", isPresented: $viewModel.userCantSignIn) {
            Text("Ok")
        } message: {
            Text("Account with this email and password does not exist!")
        }
        .sheet(isPresented: $forgotPasswordTapped) {
            ResetPasswordView(viewModel: ResetPasswordViewModel(authenticationManager: AuthenticationManager()))
                .presentationDetents([.medium])
                .presentationDragIndicator(.hidden)
        }

    }
}

// MARK: - UI Components
extension LogInView {
    
    // MARK: - AuthenticationTextFields
    private var authenticationTextFieldVStack: some View {
        VStack {
            TextField("Email", text: $viewModel.emailTextFieldText)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            SecureField("Password", text: $viewModel.passwordTextFieldText)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
    
    // MARK: - GoogleAuthenticationVStack
    private var googleAuthenticationVStack: some View {
        VStack(spacing: 10) {
            Text("Or")
            
            Text("Continue With")
            
            Image("GoogleLogo")
                .padding()
                .background(Color.white.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .foregroundStyle(.white.opacity(0.9))
        .font(.title3)
        .fontWeight(.bold)
    }
    
    // MARK: - AlreadyAccountHStack
    private var alreadyAccountHStack: some View {
        HStack {
            Text("Already have an account?")
                .foregroundStyle(.white.opacity(0.5))
                .font(.title3)
            
            Text("Login")
                .font(.title3)
                .foregroundStyle(.red)
                .onTapGesture {
                    router.navigate(to: .logInView)
                }
        }
    }
}

#Preview {
    LogInView(viewModel: LogInViewModel(authenticationManager: AuthenticationManager()))
}
