//
//  HomeViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 15.03.24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    let userId: String
    let userManager: UserManaging
    @Published var user: DatabaseUser?
    
    // MARK: - Initialization
    init(userId: String, userManager: UserManaging) {
        self.userId = userId
        self.userManager = userManager
        
        Task {
            await getUser()
        }
    }
    
    private func getUser() async {
        
        do {
            user = try await userManager.getUser(userId: userId)
        } catch {
            print("Error fetching user from Firestore. \(error)")
        }
    }
}
