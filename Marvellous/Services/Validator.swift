//
//  Validator.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 08.03.24.
//

import Foundation

final class Validator {
    
    func isValidEmail(for email: String) -> Bool {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidUsername(for username: String) -> Bool {
        let username = username.trimmingCharacters(in: .whitespacesAndNewlines)
        // username should be between 4-24 characters
        let usernameRegEx = "\\w{4,24}"
        let usernamePred = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
        return usernamePred.evaluate(with: username)
    }
    
    func isPasswordValidAboutUpperCase(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = ".*[A-Z].*"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    func isPasswordValidAboutNumbers(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = ".*[0-9].*"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    func isPasswordValidAboutSpecialCharacters(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = ".*[$@#!%*?&_\\-].*"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    func isPasswordValidAboutLength(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = "^.{8,32}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
}
