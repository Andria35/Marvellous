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
}

protocol UserManaging {
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
}
