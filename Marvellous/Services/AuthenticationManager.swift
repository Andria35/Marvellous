//
//  AuthenticationManager.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 08.03.24.
//

import Foundation
import FirebaseAuth

struct AuthDataResult {
    let uid: String
    let email: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager {
    
    func getAuthenticatedUser() throws -> AuthDataResult {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResult(user: user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}

// MARK: - Sign In Email
extension AuthenticationManager {
    
    func createUser(email: String, password: String) async throws -> AuthDataResult {
        let authDataResults = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResult(user: authDataResults.user)
    }
    
    func signInUser(email: String, password: String) async throws -> AuthDataResult {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResult(user: authDataResult.user)
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
}

// MARK: - Sign in SSO
extension AuthenticationManager {
    func signInWithGoogle(tokens: GoogleSignInResult) async throws -> AuthDataResult {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(with: credential)
    }
    
    func signIn(with credential: AuthCredential) async throws -> AuthDataResult {
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return AuthDataResult(user: authDataResult.user)
    }
}
