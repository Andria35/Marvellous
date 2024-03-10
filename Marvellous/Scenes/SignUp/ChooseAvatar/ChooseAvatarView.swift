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
    @State var selectedImage: String = ""
    
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

                AvatarImageComponentView(avatarImageName: AvatarImageName.BlackPantherAvatarImage.rawValue, selectedImage: $selectedImage)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.IronManAvatarImage.rawValue, selectedImage: $selectedImage)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.SpiderManAvatarImage.rawValue, selectedImage: $selectedImage)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.DeadPoolAvatarImage.rawValue, selectedImage: $selectedImage)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.UltronAvatarImage.rawValue, selectedImage: $selectedImage)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.VenomAvatarImage.rawValue, selectedImage: $selectedImage)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.ThanosAvatarImage.rawValue, selectedImage: $selectedImage)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.GrootAvatarImage.rawValue, selectedImage: $selectedImage)
            }
        }

    }
}

// MARK: - Preview
#Preview {
    ChooseAvatarView()
}
