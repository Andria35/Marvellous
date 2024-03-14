//
//  LogInViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 12.03.24.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

final class LogInViewModel: ObservableObject {
    
    // MARK: - Properties
    let authenticationManager: AuthenticationManager
    let utilities: Utilities
    @Published var emailTextFieldText: String = ""
    @Published var passwordTextFieldText: String = ""
    @Published var userCantSignIn: Bool = false
    
    // MARK: - Initialization
    init(authenticationManager: AuthenticationManager, utilities: Utilities) {
        
        self.authenticationManager = authenticationManager
        self.utilities = utilities
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
        
        guard let topViewController = await utilities.topViewController() else {
            return
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topViewController)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken = gidSignInResult.user.accessToken.tokenString
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        
    }
        
}
