//
//  SignUpView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 29.02.24.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: SignUpViewModel
    @EnvironmentObject var router: Router
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            
            VStack {
                Image("MarvelLogo")
                    .padding()
                
                authenticationTextFieldVStack
                
                ButtonComponentView(title: "SignUp", action: {
                    Task {
                        await viewModel.signUp()
                        if !viewModel.userNotCreated {
                            router.navigate(to: .chooseAvatarView)
                        }
                    }
                                        
                }, backgroundColor: .red, isDisabled: viewModel.isSignUpButtonDisabled)
                .padding(.top)
                
                Text("Forgot Password?")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                validatorVStack
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                alreadyAccountHStack
            }
            .padding()
            
        }
        .alert("Can't Create Account ❌", isPresented: $viewModel.userNotCreated) {
            Text("Ok")
        } message: {
            Text("Account with this email already exists!")
        }
    }
}

// MARK: - UI Components
extension SignUpView {
    
    // MARK: - AuthenticationTextFields
    private var authenticationTextFieldVStack: some View {
        VStack {
            TextField("Email", text: $viewModel.emailTextFieldText)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(alignment: .trailing) {
                    if viewModel.isEmailValid {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                            .padding()
                    } else {
                        Image(systemName: "x.circle.fill")
                            .foregroundStyle(.red)
                            .padding()
                    }
                }
            
            SecureField("Password", text: $viewModel.passwordTextFieldText)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            SecureField("Confirm Password", text: $viewModel.confirmPasswordTextFieldText)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(alignment: .trailing) {
                    
                    if !viewModel.isConfirmPasswordValid || (viewModel.passwordTextFieldText.isEmpty && viewModel.confirmPasswordTextFieldText.isEmpty) {
                        Image(systemName: "x.circle.fill")
                            .foregroundStyle(.red)
                            .padding()
                        
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                            .padding()
                    }
                }
        }
    }
    
    // MARK: - ValidatorVStack
    private var validatorVStack: some View {
        VStack(alignment: .leading) {
            if viewModel.isEightCharacterLong {
                Text("✅ At least 8 characters")
                    .foregroundStyle(.green)
            } else {
                Text("❌ At least 8 characters")
                    .foregroundStyle(.red)
            }
            
            if viewModel.containsUpperCase {
                Text("✅ Contains one uppercase letter")
                    .foregroundStyle(.green)
            } else {
                Text("❌ Contains one uppercase letter")
                    .foregroundStyle(.red)
            }
            
            if viewModel.containsNumber {
                Text("✅ Contains one number")
                    .foregroundStyle(.green)
            } else {
                Text("❌ Contains one number")
                    .foregroundStyle(.red)
            }
            
            if viewModel.containsSpecialCharacter {
                Text("✅ Contains one special character (@, #, $, %, etc.)")
                    .foregroundStyle(.green)
            } else {
                Text("❌ Contains one special character (@, #, $, %, etc.)")
                    .foregroundStyle(.red)
            }
            
        }
        .font(.title3)
        .fontWeight(.semibold)
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

// MARK: - Preview
#Preview {
    SignUpView(viewModel: SignUpViewModel(validator: Validator(), authenticatorManager: AuthenticationManager()))
}
