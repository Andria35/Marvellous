//
//  ProfileIsCreatedViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 16.03.24.
//

import Foundation

final class ProfileIsCreatedViewModel: ObservableObject {
    
    // MARK: - Properties
    let avatarImageName: String
    let username: String
    let userManager: UserManaging
    let authenticationManager: AuthenticationManaging

    // MARK: - Initialization
    init(avatarImageName: String, username: String, userManager: UserManaging, authenticationManager: AuthenticationManaging) {
        self.avatarImageName = avatarImageName
        self.username = username
        self.userManager = userManager
        self.authenticationManager = authenticationManager
    }
    
    func updateUser() async {
        do {
            let user = try authenticationManager.getAuthenticatedUser()
            try await userManager.updateUserAvatarImageName(forId: user.uid, with: avatarImageName)
            try await userManager.updateUserUsername(forId: user.uid, with: username)
        } catch {
            print("Error saving username and avatar Image name in firestore. \(error)")
        }
    }
}
