//
//  ChooseAvatarView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 10.03.24.
//

import SwiftUI

struct ChooseAvatarView: View {
    
    // MARK: - Properties
    @EnvironmentObject var router: Router
    private let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    enum AvatarImageName: String {
        case BlackPantherAvatarImage
        case IronManAvatarImage
        case SpiderManAvatarImage
        case DeadPoolAvatarImage
        case UltronAvatarImage
        case VenomAvatarImage
        case ThanosAvatarImage
        case GrootAvatarImage
    }
    
    private let avatarImageNames: [String] = [
        AvatarImageName.BlackPantherAvatarImage.rawValue,
        AvatarImageName.IronManAvatarImage.rawValue,
        AvatarImageName.SpiderManAvatarImage.rawValue,
        AvatarImageName.DeadPoolAvatarImage.rawValue,
        AvatarImageName.UltronAvatarImage.rawValue,
        AvatarImageName.VenomAvatarImage.rawValue,
        AvatarImageName.ThanosAvatarImage.rawValue,
        AvatarImageName.GrootAvatarImage.rawValue
    ]
    
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            
            VStack {
                Image("MarvelLogo")
                    .padding()
                
                Text("Choose Your Avatar")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                
                avatarImageGrid
                
                ButtonComponentView(title: "Looks Good", action: {
                    router.navigate(to: .enterUsernameView)
                }, backgroundColor: nil, isDisabled: false)
                    .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - UI Components
extension ChooseAvatarView {
    private var avatarImageGrid: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout) {
                ForEach(avatarImageNames, id: \.self) { avatarImageName in
                    AvatarImageComponentView(avatarImageName: avatarImageName)
                }
            }
        }

    }
}

// MARK: - Preview
#Preview {
    ChooseAvatarView()
}
