//
//  Router.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 29.02.24.
//

import SwiftUI

final class Router: ObservableObject {
    // MARK: - Properties
    @Published var navigationPath = NavigationPath()
    
    // MARK: - Destination
    public enum Destination: Codable, Hashable {
//        case signUpView
//        case logInView
        case chooseAvatarView
        case enterUsernameView(selectedAvatarImageName: String)
        case profileCreatedView(avatarImageName: String, username: String)
    }
    
    // MARK: - Methods
    func navigate(to destination: Destination) {
        navigationPath.append(destination)
    }
    
    func navigateBack() {
        navigationPath.removeLast()
    }
    
    func navigateToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}


