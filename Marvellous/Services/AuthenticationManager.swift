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
    
    func createUser(email: String, password: String) async throws -> AuthDataResult {
        let authDataResults = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResult(user: authDataResults.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
