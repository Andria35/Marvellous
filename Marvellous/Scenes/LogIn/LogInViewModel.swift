//
//  LogInViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 12.03.24.
//

import Foundation

final class LogInViewModel: ObservableObject {
    
    // MARK: - Properties
    let authenticationManager: AuthenticationManager
    @Published var emailTextFieldText: String = ""
    @Published var passwordTextFieldText: String = ""
    
    // MARK: - Initialization
    init(authenticationManager: AuthenticationManager) {
        
        self.authenticationManager = authenticationManager
    }
    
    func signIn() async {
        guard !emailTextFieldText.isEmpty, !passwordTextFieldText.isEmpty else { return }
        
        do {
            let returnedUserData = try await authenticationManager.signInUser(email: emailTextFieldText, password: passwordTextFieldText)
            print("Success SignIn")
            print("\(returnedUserData)")
        } catch {
            print("Error Signing In: \(error)")
        }
    }
    
}
