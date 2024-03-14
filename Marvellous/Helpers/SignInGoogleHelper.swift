//
//  SignInGoogleHelper.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 14.03.24.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

final class SignInGoogleHelper {
    
    let utilities: Utilities
    
    init(utilities: Utilities) {
        self.utilities = utilities
    }
    
    @MainActor
    func signIn() async throws -> GoogleSignInResult {
        guard let topViewController =  utilities.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topViewController)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
        let tokens = GoogleSignInResult(idToken: idToken, accessToken: accessToken)
        
        return tokens
    }
}
