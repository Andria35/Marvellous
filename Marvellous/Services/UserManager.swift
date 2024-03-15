//
//  UserManager.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 15.03.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DatabaseUser {
    let userId: String
    let email: String?
    let photoURL: String?
    let dateCreated: Data?
}

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
    
    func getUser(userId: String) async throws -> DatabaseUser {
        
        let snapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
        
        guard 
            let data = snapshot.data(),
            let userId = data["user_id"] as? String else {
            throw URLError(.badServerResponse)
        }
        
        let email = data["email"] as? String
        let photoURL = data["photo_url"] as? String
        let dateCreated = data["date_created"] as? Data
        
        return DatabaseUser(userId: userId, email: email, photoURL: photoURL, dateCreated: dateCreated)
    }
}
