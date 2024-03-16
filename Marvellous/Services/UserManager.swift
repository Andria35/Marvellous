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
    func createNewUser(user: DatabaseUser) async throws
    func getUser(userId: String) async throws -> DatabaseUser
    func updateUser(user: DatabaseUser) async throws
    func updateUserUsername(forId userId: String, with username: String) async throws
    func updateUserAvatarImageName(forId userId: String, with avatarImageName: String) async throws
}

final class UserManager: UserManaging {
    
    // MARK: - Properties
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
        
    func createNewUser(user: DatabaseUser) async throws {
        let documentSnapshot = try await userDocument(userId: user.userId).getDocument()
        guard !documentSnapshot.exists else {
            print("User already exists")
            return
        }
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    func getUser(userId: String) async throws -> DatabaseUser {
        try await userDocument(userId: userId).getDocument(as: DatabaseUser.self)
    }
    
    func updateUser(user: DatabaseUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: true)
    }
    
    func updateUserUsername(forId userId: String, with username: String) async throws {
        let updatedData: [String:Any] = [
            DatabaseUser.CodingKeys.username.rawValue : username
        ]
        try await userDocument(userId: userId).updateData(updatedData)
    }
    
    func updateUserAvatarImageName(forId userId: String, with avatarImageName: String) async throws {
        let updatedData: [String:Any] = [
            DatabaseUser.CodingKeys.avatarImageName.rawValue : avatarImageName
        ]
        try await userDocument(userId: userId).updateData(updatedData)
    }

}
