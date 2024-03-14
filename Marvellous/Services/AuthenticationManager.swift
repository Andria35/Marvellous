//
//  AuthenticationManager.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 08.03.24.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    
    func getAuthenticatedUser() throws -> AuthenticationDataResult {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthenticationDataResult(user: user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}

// MARK: - Sign In Email
extension AuthenticationManager {
    
    func createUser(email: String, password: String) async throws -> AuthenticationDataResult {
        let authDataResults = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthenticationDataResult(user: authDataResults.user)
    }
    
    func signInUser(email: String, password: String) async throws -> AuthenticationDataResult {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthenticationDataResult(user: authDataResult.user)
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
}

// MARK: - Sign in SSO
extension AuthenticationManager {
    func signInWithGoogle(tokens: GoogleSignInResult) async throws -> AuthenticationDataResult {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(with: credential)
    }
    
    func signIn(with credential: AuthCredential) async throws -> AuthenticationDataResult {
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return AuthenticationDataResult(user: authDataResult.user)
    }
}
