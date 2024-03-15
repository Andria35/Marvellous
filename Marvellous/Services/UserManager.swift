//
//  UserManager.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 15.03.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol UserManaging {
    func createNewUser(auth: AuthenticationDataResult) async throws
}

final class UserManager: UserManaging {
    
    func createNewUser(auth: AuthenticationDataResult) async throws {
        var userData: [String: Any] = [
            "user_id" : auth.uid,
            "date_created" : Timestamp(),
        ]
        if let email = auth.email {
            userData["email"] = email
        }
        
        if let photoURL = auth.photoURL {
            userData["photo_url"] = photoURL
        }
        
       try await Firestore.firestore().collection("users").document(auth.uid).setData(userData, merge: false)
    }
}
