//
//  ContentViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 14.03.24.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    let authenticationManager: AuthenticationManager
    @Published var showHomeScreen: Bool = false
    @Published var authenticatedUser: AuthenticationDataResult?
    @Published var onboardingIsPresented: Bool = true

    
    init(authenticationManager: AuthenticationManager) {
        self.authenticationManager = authenticationManager
    }
    
    func getAuthenticatedUser() {
        authenticatedUser = try? authenticationManager.getAuthenticatedUser()
        showHomeScreen = authenticatedUser == nil
        onboardingIsPresented = !showHomeScreen
    }
}
