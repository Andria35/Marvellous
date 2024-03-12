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
    @State var selectedImageName: String? 
    
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
    
    // MARK: - Body
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
                    if let selectedImageName {
                        router.navigate(to: .enterUsernameView(selectedAvatarImageName: selectedImageName))
                    }
                }, backgroundColor: nil, isDisabled: selectedImageName == nil ? true : false)
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

                AvatarImageComponentView(avatarImageName: AvatarImageName.BlackPantherAvatarImage.rawValue, selectedImageName: $selectedImageName)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.IronManAvatarImage.rawValue, selectedImageName: $selectedImageName)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.SpiderManAvatarImage.rawValue, selectedImageName: $selectedImageName)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.DeadPoolAvatarImage.rawValue, selectedImageName: $selectedImageName)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.UltronAvatarImage.rawValue, selectedImageName: $selectedImageName)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.VenomAvatarImage.rawValue, selectedImageName: $selectedImageName)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.ThanosAvatarImage.rawValue, selectedImageName: $selectedImageName)
                
                AvatarImageComponentView(avatarImageName: AvatarImageName.GrootAvatarImage.rawValue, selectedImageName: $selectedImageName)
            }
        }

    }
}

// MARK: - Preview
#Preview {
    ChooseAvatarView()
}
