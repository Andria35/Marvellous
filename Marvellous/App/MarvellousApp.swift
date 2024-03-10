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
                ContentView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .signUpView:
                            SignUpView(viewModel: SignUpViewModel(validator: Validator(), authenticatorManager: AuthenticationManager()))
                        case .logInView:
                            LogInView()
                            
                        case .chooseAvatarView:
                            ChooseAvatarView()
                        case .enterUsernameView:
                            EnterUsernameView()
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
