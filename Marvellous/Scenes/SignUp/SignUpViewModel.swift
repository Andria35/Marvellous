//
//  SignUpViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 02.03.24.
//

import Foundation
import Combine

final class SignUpViewModel: ObservableObject {
    
    // MARK: - Properties
    let validator: Validator
    let authenticatorManager: AuthenticationManaging
    var cancellables = Set<AnyCancellable>()
    @Published var emailTextFieldText: String = ""
    @Published var passwordTextFieldText: String = ""
    @Published var confirmPasswordTextFieldText: String = ""
    
    @Published var isEightCharacterLong: Bool = false
    @Published var containsUpperCase: Bool = false
    @Published var containsNumber: Bool = false
    @Published var containsSpecialCharacter: Bool = false
    @Published var isConfirmPasswordValid: Bool = false
    @Published var isEmailValid: Bool = false
    
    @Published var isSignUpButtonDisabled: Bool = true
    
    @Published var userNotCreated: Bool = false
    
    // MARK: - Initialization
    init(validator: Validator, authenticatorManager: AuthenticationManaging) {
        
        self.validator = validator
        self.authenticatorManager = authenticatorManager
        addSubscribers()
    }
    
    // MARK: - Add Subscriber Methods
    private func addSubscribers() {
        addEmailTextFieldTextSubscriber()
        addPasswordTextFieldTextSubscriber()
        addConfirmPasswordSubscriber()
        addSignUpButtonSubscriber()
    }
    
    private func addEmailTextFieldTextSubscriber() {
        $emailTextFieldText
            .sink { [weak self] email in
                guard let self else { return }
                isEmailValid = validator.isValidEmail(for: email)
            }
            .store(in: &cancellables)
    }
    
    private func addPasswordTextFieldTextSubscriber() {
        $passwordTextFieldText
            .sink { [weak self] password in
                guard let self else { return }
                isEightCharacterLong = validator.isPasswordValidAboutLength(for: password)
                containsUpperCase = validator.isPasswordValidAboutUpperCase(for: password)
                containsNumber = validator.isPasswordValidAboutNumbers(for: password)
                containsSpecialCharacter = validator.isPasswordValidAboutSpecialCharacters(for: password)
            }
            .store(in: &cancellables)
    }
    
    private func addConfirmPasswordSubscriber() {
        $confirmPasswordTextFieldText
            .map { [weak self] confirmPassword -> Bool in
                confirmPassword == self?.passwordTextFieldText
            }
            .sink { [weak self] isConfirmPasswordValid in
                self?.isConfirmPasswordValid = isConfirmPasswordValid
            }
            .store(in: &cancellables)
        
        $passwordTextFieldText
            .map { [weak self] password -> Bool in
                password == self?.confirmPasswordTextFieldText
            }
            .sink { [weak self] isConfirmPasswordValid in
                self?.isConfirmPasswordValid = isConfirmPasswordValid
            }
            .store(in: &cancellables)
    }
    
    private func addSignUpButtonSubscriber() {
        $emailTextFieldText
            .combineLatest($passwordTextFieldText, $confirmPasswordTextFieldText)
            .sink { [weak self] _ in
                guard let self else { return }
                isSignUpButtonDisabled = isSignUpDisabled()
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Utility Methods
    private func isSignUpDisabled() -> Bool {
        !(isEightCharacterLong && containsUpperCase && containsNumber && containsSpecialCharacter && isConfirmPasswordValid && isEmailValid)
    }
    
    func signUp() async {
        guard !emailTextFieldText.isEmpty, !passwordTextFieldText.isEmpty else { return }
        
        do {
            let returnedUserData = try await authenticatorManager.createUser(email: emailTextFieldText, password: passwordTextFieldText)
            print("Success SignUp")
            print("\(returnedUserData)")
            await MainActor.run {
                userNotCreated = false
            }
        } catch {
            print("Error creating User: \(error)")
            await MainActor.run {
                userNotCreated = true
            }
        }
    }
}
