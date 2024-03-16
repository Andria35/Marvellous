//
//  MarvellousApp.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI
import Firebase

@main
struct MarvellousApp: App {
    
    // MARK: - Properties
    @StateObject var router = Router()
    
    // MARK: - Initialization
    init() {
        FirebaseApp.configure()
    }
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navigationPath) {
                ContentView( viewModel: ContentViewModel(authenticationManager: AuthenticationManager()))
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .chooseAvatarView:
                            ChooseAvatarView()
                        case .enterUsernameView(let selectedAvatarImageName):
                            EnterUsernameView(selectedAvatarImageName: selectedAvatarImageName)
                        case .profileCreatedView(let avatarImageName, let username):
                            ProfileCreatedView(viewModel: ProfileIsCreatedViewModel(avatarImageName: avatarImageName, username: username, userManager: UserManager(), authenticationManager: AuthenticationManager()))
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
