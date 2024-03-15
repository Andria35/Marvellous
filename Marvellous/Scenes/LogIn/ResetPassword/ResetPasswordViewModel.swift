//
//  ResetPasswordViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 12.03.24.
//

import Foundation

final class ResetPasswordViewModel: ObservableObject {
    
    // MARK: - Properties
    let authenticationManager: AuthenticationManaging
    @Published var emailTextFieldText: String = ""
    
    // MARK: - Initialization
    init(authenticationManager: AuthenticationManaging) {
        self.authenticationManager = authenticationManager
    }
    
    // MARK: - Utility Methods
    func resetPassword() {
        
        guard !emailTextFieldText.isEmpty else { return }
        Task {
            do {
                try await authenticationManager.resetPassword(email: emailTextFieldText)
            } catch {
                print("Error reseting Password: \(error)")
            }
            
        }
    }
}
