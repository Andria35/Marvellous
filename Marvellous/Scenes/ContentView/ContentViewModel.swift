//
//  ContentViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 14.03.24.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    // MARK: - Properties
    let authenticationManager: AuthenticationManaging
    @Published var authenticatedUser: AuthenticationDataResult?
    @Published var userIsLoggedIn: Bool = false

    // MARK: - Initialization
    init(authenticationManager: AuthenticationManaging) {
        self.authenticationManager = authenticationManager
    }
    
    // MARK: - Utility Methods
    func getAuthenticatedUser() {
        authenticatedUser = try? authenticationManager.getAuthenticatedUser()
        userIsLoggedIn = authenticatedUser != nil
    }
}
