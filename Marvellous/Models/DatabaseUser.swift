//
//  DatabaseUser.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 16.03.24.
//

import Foundation

struct DatabaseUser: Codable {
    let userId: String
    let email: String?
    let photoUrl: String?
    let dateCreated: Data?
    var username: String?
    var avatarImageName: String?
    
    init(auth: AuthenticationDataResult) {
        self.userId = auth.uid
        self.email = auth.email
        self.photoUrl = auth.photoURL
        self.dateCreated = Data()
        self.username = nil
        self.avatarImageName = nil
    }
    
    init(
        userId: String,
        email: String? = nil,
        photoUrl: String? = nil,
        dateCreated: Data? = nil,
        username: String? = nil,
        avatarName: String? = nil
    ) {
        self.userId = userId
        self.email = email
        self.photoUrl = photoUrl
        self.dateCreated = dateCreated
        self.username = username
        self.avatarImageName = avatarName
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case email = "email"
        case photoUrl = "photo_url"
        case dateCreated = "date_created"
        case username = "username"
        case avatarImageName = "avatar_image_name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        self.dateCreated = try container.decodeIfPresent(Data.self, forKey: .dateCreated)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.avatarImageName = try container.decodeIfPresent(String.self, forKey: .avatarImageName)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.photoUrl, forKey: .photoUrl)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.username, forKey: .username)
        try container.encodeIfPresent(self.avatarImageName, forKey: .avatarImageName)
    }
}
