//
//  LogInView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 29.02.24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LogInView: View {
    
    // MARK: - Properties
    @EnvironmentObject var router: Router
    @StateObject var viewModel: LogInViewModel
    @State var forgotPasswordTapped: Bool = false
    @Binding var showLogIn: Bool
    
    // MARK: - Body
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
                
                forgotPasswordText
                Spacer()
                googleAuthenticationVStack
                Spacer()
                dontHaveAccountHStack
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
    
    // MARK: - ForgotPasswordText
    private var forgotPasswordText: some View {
        Text("Forgot Password?")
            .foregroundStyle(.white.opacity(0.5))
            .font(.title3)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .onTapGesture {
                forgotPasswordTapped = true
            }

    }
    
    // MARK: - GoogleAuthenticationVStack
    private var googleAuthenticationVStack: some View {
        VStack(spacing: 10) {
            Text("Or")
            
            Text("Continue With")
            
//            Image("GoogleLogo")
//                .padding()
//                .background(Color.white.opacity(0.9))
//                .clipShape(RoundedRectangle(cornerRadius: 20))
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .icon, state: .normal), action: {
                
                Task {
                    
                    do {
                        try await viewModel.signInGoogle()
                    } catch {
                        print("Error Signing In with google. \(error)")
                    }
                }
            })
        }
        .foregroundStyle(.white.opacity(0.9))
        .font(.title3)
        .fontWeight(.bold)
    }
    
    // MARK: - AlreadyAccountHStack
    private var dontHaveAccountHStack: some View {
        HStack {
            Text("Don't have an account?")
                .foregroundStyle(.white.opacity(0.5))
                .font(.title3)
            
            Text("SignUp")
                .font(.title3)
                .foregroundStyle(.red)
                .onTapGesture {
                    withAnimation {
                        showLogIn = false
                    }
                }
        }
    }
}

// MARK: - Preview
#Preview {
    LogInView(viewModel: LogInViewModel(authenticationManager: AuthenticationManager(), signInGoogleHelper: SignInGoogleHelper(utilities: Utilities())), showLogIn: .constant(true))
}
