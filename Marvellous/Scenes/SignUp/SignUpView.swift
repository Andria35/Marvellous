//
//  SignUpView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 29.02.24.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel: SignUpViewModel
    @EnvironmentObject var router: Router
    
    
    
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            
            VStack {
                Image("MarvelLogo")
                    .padding()
                
                authenticationTextFieldVStack
                
//                validatorVStack
//                    .frame(maxWidth: .infinity, alignment: .leading)

                
                ButtonComponentView(title: "SignUp", action: {}, backgroundColor: .red)
                    .padding(.top)
                
                Text("Forgot Password?")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
//                Spacer()
                
//                googleAuthenticationVStack
                validatorVStack
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                alreadyAccountHStack
                
                Spacer()
                
            }
            .padding()
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
            
            SecureField("Password", text: $viewModel.passwordTextFieldText)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            SecureField("Repeat Password", text: $viewModel.passwordTextFieldText)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))

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
                    router.navigate(to: .logIn)
                }
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel(validator: Validator()))
}
