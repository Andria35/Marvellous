//
//  SignUpViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 02.03.24.
//

import Foundation
import Combine

final class SignUpViewModel: ObservableObject {
    
    let validator: Validator
    var cancellables = Set<AnyCancellable>()
    @Published var emailTextFieldText: String = ""
    @Published var passwordTextFieldText: String = ""
    
    @Published var isEightCharacterLong: Bool = false
    @Published var containsUpperCase: Bool = false
    @Published var containsNumber: Bool = false
    @Published var containsSpecialCharacter: Bool = false
    
    init(validator: Validator) {
        
        self.validator = validator
        addPasswordTextFieldTextSubscriber()
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
    
}
