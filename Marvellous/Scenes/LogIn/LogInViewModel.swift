//
//  LogInViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 12.03.24.
//

import Foundation
import FirebaseAuth

@MainActor
final class LogInViewModel: ObservableObject {
    
    // MARK: - Properties
    let userManager: UserManaging
    let authenticationManager: AuthenticationManaging
    let signInGoogleHelper: SignInGoogleHelper
    @Published var emailTextFieldText: String = ""
    @Published var passwordTextFieldText: String = ""
    @Published var userCantSignIn: Bool = false
    
    // MARK: - Initialization
    init(authenticationManager: AuthenticationManaging, signInGoogleHelper: SignInGoogleHelper, userManager: UserManaging) {
        self.authenticationManager = authenticationManager
        self.signInGoogleHelper = signInGoogleHelper
        self.userManager = userManager
    }
    
    func signIn() async {
        guard !emailTextFieldText.isEmpty, !passwordTextFieldText.isEmpty else { return }
        
        do {
            let returnedUserData = try await authenticationManager.signInUser(email: emailTextFieldText, password: passwordTextFieldText)
            print("Success SignIn")
            print("\(returnedUserData)")
            await MainActor.run {
                userCantSignIn = false
            }
        } catch {
            print("Error Signing In: \(error)")
            await MainActor.run {
                userCantSignIn = true
            }
        }
    }
    
    func signInGoogle() async throws {
        let tokens = try await signInGoogleHelper.signIn()
        let authDataResult = try await authenticationManager.signInWithGoogle(tokens: tokens)
        let user = DatabaseUser(auth: authDataResult)
        try await userManager.createNewUser(user: user)
    }
    
}
