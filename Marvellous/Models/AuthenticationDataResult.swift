//
//  AuthenticationDataResult.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 14.03.24.
//

import Foundation
import FirebaseAuth

struct AuthenticationDataResult {
    let uid: String
    let email: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}
