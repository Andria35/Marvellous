//
//  UserManager.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 15.03.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DatabaseUser: Codable {
    let userId: String
    let email: String?
    let photoURL: String?
    let dateCreated: Data?
    var username: String?
    var avatarImageName: String?
    
    init(auth: AuthenticationDataResult) {
        self.userId = auth.uid
        self.email = auth.email
        self.photoURL = auth.photoURL
        self.dateCreated = Data()
        self.username = nil
        self.avatarImageName = nil
    }
    
    init(
    userId: String,
    email: String? = nil,
    photoURL: String? = nil,
    dateCreated: Data? = nil,
    username: String? = nil,
    avatarName: String? = nil
    ) {
        self.userId = userId
        self.email = email
        self.photoURL = photoURL
        self.dateCreated = dateCreated
        self.username = username
        self.avatarImageName = avatarName
    }
}

protocol UserManaging {
    func createNewUser(user: DatabaseUser) async throws
    func updateUserUsername(forId userId: String, with username: String) async throws
}

final class UserManager: UserManaging {
    
    // MARK: - Properties
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
        
    }()
    
    func createNewUser(user: DatabaseUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false, encoder: encoder)
    }
    
    func getUser(userId: String) async throws -> DatabaseUser {
        try await userDocument(userId: userId).getDocument(as: DatabaseUser.self, decoder: decoder)
    }
    
    func updateUser(user: DatabaseUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: true, encoder: encoder)
    }
    
    func updateUserUsername(forId userId: String, with username: String) async throws {
        let updatedData: [String:Any] = [
            "username" : username
        ]
        try await userDocument(userId: userId).updateData(updatedData)
    }
    
    func updateUserAvatarImageName(forId userId: String, with avatarName: String) async throws {
        let updatedData: [String:Any] = [
            "avatar_name" : avatarName
        ]
        try await userDocument(userId: userId).updateData(updatedData)
    }

}
